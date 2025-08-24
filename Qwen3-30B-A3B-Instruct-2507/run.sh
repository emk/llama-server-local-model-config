#!/bin/bash
#
# Run the llama.cpp server with specific model and settings.

# Source centralized setup script
source ../setup_llama_server.sh
switch_to_llama_cpp_dir llama-cpp-master

run_llama_server \
    --jinja \
    --reasoning-format none \
    --model "${model_dir}/Qwen3-30B-A3B-Instruct-2507-IQ4_NL.gguf" \
    --alias Qwen3-30B-A3B-Instruct-2507 \
    --gpu-layers 100 \
    --batch-size 2048 \
    --ubatch-size 512 \
    --no-mmap \
    --ctx-size "$(( 32*1024 ))" \
    --flash-attn

# We could probably go faster with:
#
#    --model-draft "${model_dir}/Qwen3-0.6B-IQ4_NL.gguf" \
#    --gpu-layers-draft 100 \
#
# ...but this no longer fits on the GPU.
