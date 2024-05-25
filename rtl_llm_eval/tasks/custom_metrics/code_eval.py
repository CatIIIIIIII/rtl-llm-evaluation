import os
import itertools
import numpy as np
import os.path as osp
from collections import Counter, defaultdict
from concurrent.futures import ThreadPoolExecutor, as_completed

from ...utils import exec_shell

_WARNING = """
################################################################################
                                  !!!WARNING!!!
################################################################################
The "code_eval" metric executes untrusted model-generated code in Verilog.
Although it is highly unlikely that model-generated code will do something
overtly malicious in response to this test suite, model-generated code may act
destructively due to a lack of model capability or alignment.
Users are strongly encouraged to sandbox this evaluation suite so that it
does not perform destructive actions on their host or network. 

Once you have read this disclaimer and taken appropriate precautions,
set the environment variable HF_ALLOW_CODE_EVAL="1". Within Python you can to this
with:

>>> import os
>>> os.environ["HF_ALLOW_CODE_EVAL"] = "1"

################################################################################
"""

def compute_code_eval(generations, references, check_correct, k=[1, 5, 100], num_workers=8, timeout=3.0):

    if os.getenv("HF_ALLOW_CODE_EVAL", 0) != "1":
        raise ValueError(_WARNING)

    exit_code, cmd_output = exec_shell("vsim -c -version")
    assert exit_code == 1, "Failed to check Modelsim version."
    assert "Model Technology ModelSim" in cmd_output, "Please install Modelsim and make sure that the execuation file has been added to $PATH."

    with ThreadPoolExecutor(max_workers=num_workers) as executor:
        completion_id = Counter()
        results = defaultdict(list)

        # Determine the number of candidates
        n_cand = max(len(candidates) for candidates, _ in zip(generations, references))
        for i_cand in range(n_cand):
            futures = []
            for task_id, (candidates, _) in enumerate(zip(generations, references)):
                if i_cand < len(candidates):
                    candidate = candidates[i_cand]
                    check_args = dict(
                        task_id=task_id,
                        exp_name=candidate["exp_name"],
                        generation=candidate["generation"],
                        completion_id=completion_id[task_id],
                    )
                    future = executor.submit(check_correct, **check_args)
                    futures.append(future)
                    completion_id[task_id] += 1
            
            # Wait for all futures in this batch to complete
            for future in as_completed(futures):
                result = future.result()
                results[result["task_id"]].append((result["completion_id"], result))

    total_syntax, correct_syntax = [], []
    total_testbench, correct_testbench = [], []
    for result in results.values():
        result.sort()
        syntax_passed = [r[1]["syntax_passed"] for r in result]
        testbench_passed = [r[1]["testbench_passed"] for r in result]
        total_syntax.append(len(syntax_passed))
        correct_syntax.append(sum(syntax_passed))
        total_testbench.append(len(testbench_passed))
        correct_testbench.append(sum(testbench_passed))
    total_syntax = np.array(total_syntax)
    correct_syntax = np.array(correct_syntax)
    total_testbench = np.array(total_testbench)
    correct_testbench = np.array(correct_testbench)
    
    ks = k
    if not isinstance(ks, (list, tuple)):
        ks = [ks]
    pass_at_k_syntax = {f"pass@{k}": estimate_pass_at_k(total_syntax, correct_syntax, k).mean() for k in ks if (total_syntax >= k).all()}
    pass_at_k_testbench = {f"pass@{k}": estimate_pass_at_k(total_testbench, correct_testbench, k).mean() for k in ks if (total_testbench >= k).all()}

    return pass_at_k_syntax, pass_at_k_testbench, results


def estimate_pass_at_k(num_samples, num_correct, k):
    """Estimates pass@k of each problem and returns them in an array."""

    def estimator(n: int, c: int, k: int) -> float:
        """Calculates 1 - comb(n - c, k) / comb(n, k)."""
        if n - c < k:
            return 1.0
        return 1.0 - np.prod(1.0 - k / np.arange(n - c + 1, n + 1))

    if isinstance(num_samples, int):
        num_samples_it = itertools.repeat(num_samples, len(num_correct))
    else:
        assert len(num_samples) == len(num_correct)
        num_samples_it = iter(num_samples)

    return np.array([estimator(int(n), int(c), k) for n, c in zip(num_samples_it, num_correct)])
