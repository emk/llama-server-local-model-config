# DO NOT INVOKE DIRECTLY. This is sourced by run.sh scripts.
#
# Centralized setup script for llama.cpp server configuration. This script
# contains all common setup code shared across model configurations. The
# llama-server command and its arguments remain in individual run.sh files.

set -euo pipefail

# Load environment variables from .env file in project root.
#
# Note that the ../.env should point to the right place when
# we're sourced from other directories.
if [[ -f ../.env ]]; then
  source ../.env
fi

if [[ -z "${API_KEY:-}" ]]; then
  echo "Error: API_KEY is not set in .env file" >&2
  exit 1
fi

# Our host.
host="${HOST:-0.0.0.0}"

# Our port. We run this on port 3191 instead of 3190, to avoid conflict with Jan
# AI.
port="${PORT:-3191}"

# Remember the directory containing our models.
model_dir="$(pwd)"

# Function to change to the llama-cpp directory
switch_to_llama_cpp_dir() {
  local llama_dir="$1"
  cd ~/src/"$llama_dir" || exit 1
}
