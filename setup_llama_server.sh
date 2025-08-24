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

# Remember the directory containing our models.
model_dir="$(pwd)"

# Default arguments for llama-server that are common across models. These are
# arguments that should not need to be changed for different model sizes,
# families, or types.
#
# We run this on port 3191 instead of 3190, to avoid conflict with Jan AI.
llama_default_args="--no-webui --api-key $API_KEY --host ${HOST:-0.0.0.0} --port ${PORT:-3191} --no-context-shift --log-verbose"

echo "$llama_default_args"

# Function to change to the llama-cpp directory
switch_to_llama_cpp_dir() {
  local llama_dir="$1"
  cd ~/src/"$llama_dir" || exit 1
}
