# Project Architecture Overview

The most important files are:

- `setup_llama_server.sh`: Common setup
- `$MODEL/`: Model-specific subdirectories
  - `run.sh`: Model runner (sources `setup_llama_server.sh`)
  - `bench.sh`: Optional, manually-created script for benchmarking a few specific models.
  - `*.gguf`: Model files
  - `*.jinja`: Optional model chat templates
  - `*.gbnf`: Optional grammar constraints for model output (rarely needed)
- `.env.template`: Copy of `.env` with no secrets
- `.env`: Secret file (not necessarily accessible)
