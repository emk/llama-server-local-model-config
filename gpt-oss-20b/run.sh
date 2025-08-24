#!/bin/bash
#
# Run the llama.cpp server with specific model and settings.
#
# Grammar from https://alde.dev/blog/gpt-oss-20b-with-cline-and-roo-code/.

# Source centralized setup script
source ../setup_llama_server.sh
switch_to_llama_cpp_dir llama-cpp-master

run_llama_server \
    --jinja \
    --reasoning-format auto \
    --model "${model_dir}/gpt-oss-20b-F16.gguf" \
    --alias gpt-oss-20b \
    --gpu-layers 100 \
    --batch-size 2048 \
    --ubatch-size 512 \
    --no-mmap \
    --ctx-size "$(( 64*1024 ))" \
    --flash-attn \
    --grammar-file "${model_dir}/cline.gbnf"
