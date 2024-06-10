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


class Instruct(Task):
    
    DATASET_PATH = "benchmark/instruct"
    DATASET_NAME = "instruct"

    def __init__(self):
        super().__init__(
            stop_words=["\n\n\n\n\n", "\\END"],
            requires_execution=False
        )
        
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
        return doc["instruction"]

    def get_reference(self, doc):
        """
        Builds the reference solution for the doc (sample from the dataset).
        :param doc: dict[str: str]
            sample from the dataset
        :return: str
        """
        return doc["output"]

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
            'idx': idx,
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
    
