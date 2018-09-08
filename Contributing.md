# Contributing

The main thing to understand about the structure of this project is the `get-impl-path` script.

Basically, when you call into `init.sh`, it uses `get-impl-path` to find the appropriate implementation for your system. `get-impl-path` will check the OS, and if there is a version of the specific init script for that OS, that script will be executed. Otherwise, the `shared` version will be executed.

Several scripts exist on `$PATH` (after the standard file header) to simplify using `get-impl-path`:

    # Execute the "bin/script" script with args "arg1" and "arg2"
    script "arg1" "arg2"
    # Source the "cli/script.sh" script
    source source-impl "cli/script.sh"
    # Copy the "etc/resource" file to "$BENCH/resource"
    copy-impl "etc/resource" "$BENCH/resource"

Usually the OS-specific version of a script will execute the `shared` version with `source-shared "cli/script.sh"`.

## Standard file header

**The standard file header is the *only* time a script should reference another file directly**

Every `sh` script should start with a *variation* of following standard header:

    #!/bin/sh

    source "${INIT_REPO:-$(dirname "$0")}/vars.sh"

This tries to find the location `$INIT_REPO` based on how it was executed if it was not provided by the environment. Then it loads the environment variables and does any validation and transformation required before those variables can be used.

The standard header above is for scripts in the root of the repository. Finding `$INIT_REPO` is different depending on the location of the script. For example, scripts in the `shared/bin` directory will use this variation instead:

    #!/bin/sh

    source "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

Be sure to use the correct variation for the nesting level of your script.
