#!/bin/bash
#
# Run the llama.cpp server with specific model and settings.
#
# We run this on port 3191 instead of 3190, to avoid conflict
# with Jan AI.

set -euo pipefail

# Load environment variables from .env file in project root
if [[ -f ../.env ]]; then
  source ../.env
fi

if [[ -z "${API_KEY:-}" ]]; then
  echo "Error: API_KEY is not set in .env file" >&2
  exit 1
fi

model_dir="$(pwd)"
cd ~/src/llama-cpp || exit 1
build/bin/llama-server \
    --no-webui  \
    --api-key "$API_KEY" \
    --jinja \
    --reasoning-format none \
    -m "${model_dir}/Qwen3-30B-A3B-Instruct-2507-IQ4_NL.gguf" \
    --alias Qwen3-30B-A3B-Instruct-2507 \
    --host 0.0.0.0 \
    --port 3191 \
    --gpu-layers 100 \
    --batch-size 2048 \
    --ubatch-size 512 \
    --no-context-shift \
    --no-mmap \
    --ctx-size "$(( 32*1024 ))" \
    --log-verbose
