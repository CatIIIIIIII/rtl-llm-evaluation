# rtl-llm-evaluation

Need to install ModelSim first.

Usage:

accelerate launch --config-file configs/accel.yaml  main.py --model /home/wangning/RTLDebugger/rtllama/outputs/codellama/pretrain/full/ --tasks rtllm --max_length_generation 4096 --precision fp16 --save_generations --allow_code_execution --n_samples 5 --batch_size 5 --limit 8

--limit is the number of experiments to generate;
--n_samples is the number of samples to generate for each experiment;
--batch_size is the number of samples to generate in parallel;