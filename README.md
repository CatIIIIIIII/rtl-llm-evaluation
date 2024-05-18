# rtl-llm-evaluation

Need to install ModelSim first.

Usage:

accelerate launch  main.py --model /data/ckpt/codellama/CodeLlama-7b-Instruct-hf/ --tasks rtllm --max_length_generation 4096 --precision fp16 --limit 8 --save_generations --allow_code_execution

--limit is the number of experiments to generate.