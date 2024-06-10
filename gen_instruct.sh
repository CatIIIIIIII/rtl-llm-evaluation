#!/bin/bash
MODEL_PATH=$1
CUDA_VISIBLE_DEVICES=0,1,2,3,4,5 accelerate launch \
    --config-file configs/accel.yaml  main.py \
    --model $MODEL_PATH  \
    --tasks instruct \
    --max_length_generation 2049 \
    --precision bf16 \
    --allow_code_execution \
    --generation_only \
    --save_generations \
    --n_samples 2 \
    --batch_size 2 \
    --limit 12030 \
    --top_p 0.95 \
    --temperature 0.2 \
    --top_k 0 \
