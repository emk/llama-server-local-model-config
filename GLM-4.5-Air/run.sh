#!/bin/bash
#
# Run the llama.cpp server with specific model and settings.
#
# We run this on port 3191 instead of 3190, to avoid conflict
# with Jan AI.
#
# See https://github.com/ggml-org/llama.cpp/pull/15186 for the
# PR needed to fix tool calling.

# Source centralized setup script
source ../setup_llama_server.sh
switch_to_llama_cpp_dir llama-cpp-glm45

build/bin/llama-server \
    --no-webui  \
    --api-key "$API_KEY" \
    --jinja \
    --reasoning-format none \
    -m "${model_dir}/GLM-4.5-Air-IQ4_XS-00001-of-00002.gguf" \
    --alias GLM-4.5-Air \
    --host 0.0.0.0 \
    --port 3191 \
    --chat-template-file "${model_dir}/template-1.jinja" \
    --gpu-layers 10 \
    --batch-size 2048 \
    --ubatch-size 512 \
    --no-context-shift \
    --no-mmap \
    --ctx-size "$(( 32*1024 ))" \
    --log-verbose
