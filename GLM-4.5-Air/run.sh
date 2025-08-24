#!/bin/bash
#
# Run the llama.cpp server with specific model and settings.
#
# See https://github.com/ggml-org/llama.cpp/pull/15186 for the
# PR needed to fix tool calling.

# Source centralized setup script
source ../setup_llama_server.sh
switch_to_llama_cpp_dir llama-cpp-glm45

build/bin/llama-server $llama_default_args \
    --jinja \
    --reasoning-format none \
    -m "${model_dir}/GLM-4.5-Air-IQ4_XS-00001-of-00002.gguf" \
    --alias GLM-4.5-Air \
    --chat-template-file "${model_dir}/template-1.jinja" \
    --gpu-layers 15 \
    --batch-size 2048 \
    --ubatch-size 512 \
    --no-mmap \
    --ctx-size "$(( 32*1024 ))" \
    --flash-attn \
    --threads 8
