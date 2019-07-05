#!/usr/bin/env bash

_path_fix_hook() {
    local previous_exit_status=$?;
    export PATH=$(/usr/bin/cygpath --unix --path "$PATH")
    return $previous_exit_status;
}
if ! [[ "$PROMPT_COMMAND" =~ _path_fix_hook ]]; then
    PROMPT_COMMAND="_path_fix_hook;$PROMPT_COMMAND"
fi
eval "$(direnv hook bash)"
