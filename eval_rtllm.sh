#!/bin/bash

CUDA_VISIBLE_DEVICES=1,2,3,4,5,6,7 accelerate launch \
    --config-file configs/accel.yaml  main.py \
    --model /data/ckpt/wangning/codellama-7B/pretrain/full_bf16_e1  \
    --tasks rtllm \
    --max_length_generation 2048 \
    --precision bf16 \
    --allow_code_execution \
    --n_samples 5 \
    --batch_size 5 \
    --limit 28