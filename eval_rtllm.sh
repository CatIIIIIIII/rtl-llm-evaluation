#!/bin/bash
MODEL_PATH=$1
CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6 accelerate launch \
    --config-file configs/accel.yaml  main.py \
    --model $MODEL_PATH  \
    --tasks rtllm \
    --max_length_generation 2048 \
    --precision bf16 \
    --allow_code_execution \
    --n_samples 5 \
    --batch_size 5 \
    --limit 28 \
    --top_p 0.95 \
    --temperature 0.2
