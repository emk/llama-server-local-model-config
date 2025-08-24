#!/bin/bash
#
# Test llama.cpp server performance.

# Source centralized setup script
source ../setup_llama_server.sh
switch_to_llama_cpp_dir llama-cpp-master

build/bin/llama-bench \
  --model "${model_dir}/Qwen3-30B-A3B-Instruct-2507-IQ4_NL.gguf" \
  --repetitions 2 \
  -pg 10240,5120 \
  --n-gpu-layers 100 \
  --batch-size 2048 \
  --ubatch-size 512 \
  --cache-type-k f16 \
  --cache-type-v f16 \
  --flash-attn 1 \
  --mmap 0

# --cache-type-k q8_0 --cache-type-k f16 
# --cache-type-v q8_0 --cache-type-v f16
#

# --cache-type-k q8_0 seems to cut speed for pp10240+tg5120 from 194.69 ± 2.25
# to 87.14 ± 0.02.

#  --batch-size 1024 --batch-size 2048 \
#  --ubatch-size 512 --ubatch-size 1024 \
#
# These seem pretty neutral with minimal impact.

#  --flash-attn 0 --flash-attn 1 \
#
# On longer context *only*, flash attention jumps from 195.57 ± 0.62 to 282.83 ±
# 0.10.

#    --threads 1 --threads 8 \
#
# This doesn't seem to make any difference for GPU-only models.
