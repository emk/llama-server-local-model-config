#!/bin/bash
#
# Test llama.cpp server performance.

# Source centralized setup script
source ../setup_llama_server.sh
switch_to_llama_cpp_dir llama-cpp-glm45

build/bin/llama-bench \
  --model "${model_dir}/GLM-4.5-Air-IQ4_XS.gguf" \
  --repetitions 2 \
  -ng 10240,5120 \
  --n-gpu-layers 15 \
  --cache-type-k f16 \
  --cache-type-v f16 \
  --batch-size 2048 \
  --ubatch-size 1024 \
  --threads 1 --threads 8 \
  --mmap 0

# Things to try:

#   --flash-attn 0 --flash-attn 1 \
