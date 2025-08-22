#!/bin/bash
#
# Run the llama.cpp server with specific model and settings.
#
# We run this on port 3191 instead of 3190, to avoid conflict
# with Jan AI.
#
# See https://github.com/ggml-org/llama.cpp/issues/15012#issuecomment-3165984279
# for a template file which works, at least occasionally.

# Source centralized setup script
source ../setup_llama_server.sh

build/bin/llama-server \
    --no-webui  \
    --api-key "$API_KEY" \
    --jinja \
    --reasoning-format none \
    -m "${model_dir}/Qwen3-Coder-30B-A3B-Instruct-IQ4_XS.gguf" \
    --alias Qwen3-Coder-30B-A3B-Instruct \
    --host 0.0.0.0 \
    --port 3191 \
    --chat-template-file "${model_dir}/template-1.jinja" \
    --gpu-layers 100 \
    --batch-size 2048 \
    --ubatch-size 512 \
    --no-context-shift \
    --no-mmap \
    --ctx-size "$(( 32*1024 ))" \
    --log-verbose
