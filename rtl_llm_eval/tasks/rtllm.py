"""RTLLM: An Open-Source Benchmark for Design RTL Generation with Large Language Model
https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=10473904

We propose an open-source benchmark named RTLLM, for generating design RTL with 
natural language instructions. To systematically evaluate the auto-generated design RTL, we summarized three progressive goals, named syntax goal, functionality goal, and design quality goal. This benchmark can automatically provide a quantitative  evaluation of any given LLM-based solution.

Homepage: https://github.com/hkust-zhiyao/RTLLM/tree/main
"""
import os
import os.path as osp

from .base import Task
from .custom_metrics.code_eval import compute_code_eval
from ..utils import exec_shell

_CITATION = """
@inproceedings{lu2024rtllm,
  title={RTLLM: An open-source benchmark for design rtl generation with large language model},
  author={Lu, Yao and Liu, Shang and Zhang, Qijun and Xie, Zhiyao},
  booktitle={2024 29th Asia and South Pacific Design Automation Conference (ASP-DAC)},
  pages={722--727},
  year={2024},
  organization={IEEE}
}
"""


class RTLLM(Task):
    
    DATASET_PATH = "benchmark/rtllm"
    DATASET_NAME = "RTLLM"

    def __init__(self):
        super().__init__(
            stop_words=["\n\n\n\n\n", "\\END"],
        )
        self._clean()
        
    def _clean(self):
        """Clean the dataset execution before running the task.
        """
        exit_code, _ = exec_shell(f"bash {self.DATASET_PATH}/clean.sh")
        assert exit_code == 1, "Failed to clean the dataset execution."
        
    def get_dataset(self):
        """Returns dataset for the task or an iterable of any object, that get_prompt can handle"""
        dataset = self.dataset["validation"]
        return dataset

    def get_prompt(self, doc):
        """
        Builds the reference solution for the doc (sample from the dataset).
        :param doc: dict[str: str]
            sample from the dataset
        :return: str
        """
        exp_path =osp.join(self.DATASET_PATH, osp.join(doc["exp_name"]))
        with open(osp.join(exp_path, "design_description.txt")) as f:
            design_desc = f.readlines()
        design_desc = "".join(design_desc)
        prompt = f'"""{design_desc}\nYou could define helper functions if needed. When you have finished, end the whole file with a line containing only "//END". \n"""'
        return prompt

    def get_reference(self, doc):
        """
        Builds the reference solution for the doc (sample from the dataset).
        :param doc: dict[str: str]
            sample from the dataset
        :return: str
        """
        exp_name = doc["exp_name"]
        exp_path = osp.join(self.DATASET_PATH, exp_name)
        with open(osp.join(exp_path, f"verified_{exp_name}.v")) as f:
            verified_code = f.readlines()
        return verified_code

    def postprocess_generation(self, generation, idx):
        """
        Defines the postprocessing for a LM generation.
        :param generation: str
            code generation from LM
        :param idx: int (if needed)
            index of doc in the dataset to which the generation belongs
        :return: str
        """
        def filter(gen):
            # remove the wrong comments line start with '#'
            gen_lines = gen.split('\n')
            gen_lines = [line for line in gen_lines if not line.strip().startswith('#')]
            return '\n'.join(gen_lines)
        
        dataset = self.get_dataset()
        prompt = self.get_prompt(dataset[idx])
        generation = self._stop_at_stop_token(generation[len(prompt) :], self.stop_words)
        generation = filter(generation)
        
        post_gen = {
            'task': self.DATASET_NAME, 
            'exp_name': dataset[idx]["exp_name"],
            'prompt': prompt,
            'generation': generation
            }
        return post_gen

    def process_results(self, generations, references):
        """
        Takes the list of LM generations and evaluates them against ground truth references,
        returning the metric for the generations as in {"metric_name": result}.
        We encourage to directly load the metric from `evaluate` library to keep the code concise.
        :param generations: list(list(str))
            list of lists containing generations
        :param references: list(str)
            list of str containing refrences
        :return: dict[str: float]
        """
        pass_at_k_syntax, pass_at_k_testbench, _ = compute_code_eval(generations, references, self.check_correct)
                
        return {
            "pass_at_k_syntax": pass_at_k_syntax,
            "pass_at_k_testbench": pass_at_k_testbench
        }
    
    def check_correct(self, task_id, exp_name, generation, completion_id):
        exp_path = osp.join(self.DATASET_PATH, exp_name)
        gen_file_path  = osp.join(exp_path, f"{exp_name}.v")
        if osp.exists(gen_file_path):
            os.remove(gen_file_path)
        with open(gen_file_path, "w") as f:
            f.write(generation)
        
        # if generation contains only '\n', return False
        if set(generation) != set('\n'):
            # comlilation
            exit_code, cmd_output = exec_shell(f"bash {self.DATASET_PATH}/make_compile.sh {exp_name}")
            assert exit_code == 1, "Failed to check candidate programme syntax."
            syntax_passed = ("Errors: 0" in cmd_output)
            
            # testbench
            testbench_passed = False
            if syntax_passed:
                exit_code, cmd_output = exec_shell(f"bash {self.DATASET_PATH}/make_testbench.sh {exp_name}")
                testbench_passed = ("Errors: 0, Warnings: 0" in cmd_output)
        else:
            syntax_passed, testbench_passed = False, False
        
        return dict(
            task_id=task_id,
            syntax_passed=syntax_passed,
            testbench_passed=testbench_passed,
            completion_id=completion_id,
        )
        
    