#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

touch ~/.emacs.d/init.el
append '(load-file "~/.emacs.d/init.el")' "$HOME/.emacs"
