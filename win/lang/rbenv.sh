#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

RBENV_ROOT=${RBENV_ROOT:-$BENCH/lib/rbenv}
if ! test -d "$RBENV_ROOT"; then
    git clone https://github.com/nak1114/rbenv-win.git "$RBENV_ROOT"
fi

mkdir -p "$RBENV_ROOT/shims" "$RBENV_ROOT/versions"
. install-var RBENV_ROOT "$RBENV_ROOT"
. install-path "$RBENV_ROOT/bin" "$RBENV_ROOT/shims"

for batfile in "$RBENV_ROOT"/bin/*.bat "$RBENV_ROOT"/shims/*.bat; do
    name=$(basename "$batfile" '.bat')
    printf '%s\n' '#!/bin/sh' "cmd //c call '$batfile' \$*" > "$BENCH/bin/$name"
done
