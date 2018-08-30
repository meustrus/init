# Contributing

## Standard file header

Every `sh` script should start with a *variation* of following standard header:

    #!/bin/sh

    source "${INIT_REPO:-$(dirname "$0")}/vars.sh"

This tries to find the location `$INIT_REPO` based on how it was executed if it was not provided by the environment. Then it loads the environment variables and does any validation and transformation required before those variables can be used.

The standard header above is for scripts in the root of the repository. Finding `$INIT_REPO` is different depending on the location of the script. For example, scripts in the `shared/bin` directory will use this variation instead:

    #!/bin/sh

    source "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

Be sure to use the correct variation for the nesting level of your script.
