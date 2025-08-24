#!/bin/bash
#
# Test llama.cpp server performance.

# Source centralized setup script
source ../setup_llama_server.sh
switch_to_llama_cpp_dir llama-cpp-glm45

build/bin/llama-bench \
  --model "${model_dir}/GLM-4.5-Air-IQ4_XS.gguf" \
  --repetitions 2 \
  -pg 10240,5120 \
  --n-gpu-layers 10 \
  --cache-type-k f16 \
  --cache-type-v f16 \
  --batch-size 2048 \
  --ubatch-size 1024 \
  --threads 8 \
  --flash-attn 0 \
  --mmap 0

# --threads 1
#
# 8 threads (10.73 ± 0.01) faster than 1 (3.95 ± 0.00) on pure generation.

# --flash-attn 0 --flash-attn 1
#
# Flash attention seems slower? 13.40 ± 0.06 without, 8.62 ± 0.00 with.
