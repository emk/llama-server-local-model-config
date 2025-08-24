# Project "Rubber Duck": Running local models with `llama-server`

This project runs local models using `llama-server`, with a focus on coding models. Parameters are tuned for an Nvidia 3090 with 24GB of VRAM, and an AMD Ryzen 9 with 64GB of RAM. Models are tested with [Cline](https://cline.bot/) or [Jan](https://jan.ai/).

Performance:

- The 30B and smaller models are extremely fast, though Qwen3 Coder tool calls are unreliable.
- GLM 4.5 Air is pretty clearly smarter, and using a draft model helps a lot. But it's still _slow_.
- Nothing here competes with Claude Sonnet 4.

Basically, these models are a slightly smarter version of [keeping a rubber duck on your desk](https://en.wikipedia.org/wiki/Rubber_duck_debugging), hence "Project Rubber Duck".

**Disclosure:** Some code in this repo is written using the agents it supports, because I need to test them somehow.

The various Jinja templates and BNF grammar files are typically taken from GitHub issue threads for `llama-server`. You should be able to find the originals by reading the comments in `run.sh`.

## Setup

To use on a new machine:

1. Build local copies of llama.cpp and edit their locations in `switch_to_llama_cpp_dir`.
1. `cd` to an appropriate model directory.
2. Read `./run.sh` and download the model files it wants.
3. Run `./run.sh`, and see if it works.
