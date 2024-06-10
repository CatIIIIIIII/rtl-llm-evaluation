#!/bin/bash
MODEL_PATH=$1
CUDA_VISIBLE_DEVICES=0 accelerate launch \
    --config-file configs/accel_gpu1.yaml  main.py \
    --model $MODEL_PATH  \
    --tasks radix \
    --max_length_generation 2048 \
    --precision fp32 \
    --allow_code_execution \
    --n_samples 5 \
    --batch_size 5 \
    --limit 1 \
    --top_p 0.95 \
    --temperature 0.2
