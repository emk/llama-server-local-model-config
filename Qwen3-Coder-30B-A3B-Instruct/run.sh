#!/bin/bash
#
# Run the llama.cpp server with specific model and settings.
#
# See https://github.com/ggml-org/llama.cpp/issues/15012#issuecomment-3165984279
# for a template file which works, at least occasionally.

# Source centralized setup script
source ../setup_llama_server.sh
switch_to_llama_cpp_dir llama-cpp-master

build/bin/llama-server \
    --no-webui  \
    --api-key "$API_KEY" \
    --jinja \
    --reasoning-format none \
    -m "${model_dir}/Qwen3-Coder-30B-A3B-Instruct-IQ4_XS.gguf" \
    --alias Qwen3-Coder-30B-A3B-Instruct \
    --host "$host" \
    --port "$port" \
    --chat-template-file "${model_dir}/template-1.jinja" \
    --gpu-layers 100 \
    --batch-size 2048 \
    --ubatch-size 512 \
    --no-context-shift \
    --no-mmap \
    --ctx-size "$(( 32*1024 ))" \
    --log-verbose
