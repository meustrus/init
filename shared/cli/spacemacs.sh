#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

SPACEMACSD="$HOME/.emacs.d/spacemacs"
SPACEMACS_REPO='https://github.com/syl20bnr/spacemacs'

INIT_CLI_EMACS=ON . `get-impl-path "cli/emacs.sh"`

if ! ( SPACEMACSD_REMOTE=$(git -C "$SPACEMACSD" remote get-url origin 2>/dev/null) && test "$SPACEMACSD_REMOTE" = "$SPACEMACS_REPO" ); then
    if test -d "$SPACEMACSD"; then
        EMACS_BAK_N=1
        while test -d "$SPACEMACSD.bak$EMACS_BAK_N"; do
            EMACS_BAK_N=$(expr $EMACS_BAK_N + 1)
        done
        printf 'Backing up existing spacemacs configuration\n\tin "%s"\n\tto "%s"\n' "$SPACEMACSD" "$SPACEMACSD.bak$EMACS_BAK_N" 1>&2
        mv "$SPACEMACSD" "$SPACEMACSD.bak$EMACS_BAK_N"
    fi

    git clone "$SPACEMACS_REPO" "$SPACEMACSD"
fi

append "$(printf '; Spacemacs\n(setq spacemacs-start-directory "~/.emacs.d/spacemacs/")\n(load-file (concat spacemacs-start-directory "init.el"))')" "$HOME/.emacs.d/init.el"
