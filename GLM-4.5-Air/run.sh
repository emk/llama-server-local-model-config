#!/bin/bash
#
# Run the llama.cpp server with specific model and settings.
#
# See https://github.com/ggml-org/llama.cpp/pull/15186 for the
# PR needed to fix tool calling.

# Source centralized setup script
source ../setup_llama_server.sh
switch_to_llama_cpp_dir llama-cpp-glm45

run_llama_server \
    --jinja \
    --reasoning-format none \
    --model "${model_dir}/GLM-4.5-Air-IQ4_XS-00001-of-00002.gguf" \
    --model-draft "${model_dir}/GLM-4.5-DRAFT-0.6B-32k-Q4_0.gguf" \
    --alias GLM-4.5-Air \
    --chat-template-file "${model_dir}/template-1.jinja" \
    --gpu-layers 9 \
    --gpu-layers-draft 100 \
    --batch-size 2048 \
    --ubatch-size 512 \
    --no-mmap \
    --ctx-size "$(( 32*1024 ))" \
    --threads 8
