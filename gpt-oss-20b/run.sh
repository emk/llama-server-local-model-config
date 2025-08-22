#!/bin/bash
#
# Run the llama.cpp server with specific model and settings.
#
# We run this on port 3191 instead of 3190, to avoid conflict
# with Jan AI.

# Source centralized setup script
source ../setup_llama_server.sh
switch_to_llama_cpp_dir llama-cpp

build/bin/llama-server \
    --no-webui  \
    --api-key "$API_KEY" \
    --jinja \
    --reasoning-format auto \
    -m "${model_dir}/gpt-oss-20b-F16.gguf" \
    --alias gpt-oss-20b \
    --host 0.0.0.0 \
    --port 3191 \
    --gpu-layers 100 \
    --batch-size 2048 \
    --ubatch-size 512 \
    --no-context-shift \
    --no-mmap \
    --ctx-size "$(( 48*1024 ))" \
    --flash-attn \
    --grammar-file "${model_dir}/cline.gbnf" \
    --log-verbose
