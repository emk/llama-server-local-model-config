# Shell scripting conventions

All shell scripts should use `bash` and include a shbang line,
followed by a one line comment explaining what they do.

When writing shell scripts, be sure to use:

```sh
set -euo pipefail
```

...to enable error handling. Check for any error conditions that the shell doesn't handle automatically.

Finally, all credentials should stored in a top-level `.env` file, which should be included in `.gitignore`. There should _also_ be an `.env.template` file which contains the same variables with empty values assigned. This should be committed.

When using shell variables, be sure to quote them as needed to protect against whitespace in their values.

Use UPPERCASE variable names for `export`ed variables or ones we get from our calling environment. User lowercase for script-internal and `local` variables.