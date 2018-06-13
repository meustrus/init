#!/bin/sh

INIT_REPO=${INIT_REPO:-$(cd "$(dirname "$0")/.." && pwd)}

source "$INIT_REPO/shared/cli/shell.sh"
source "$INIT_REPO/shared/cli/git.sh"
source "$INIT_REPO/shared/cli/my.sh"
source "$INIT_REPO/shared/cli/ssh.sh"
source "$INIT_REPO/shared/lang/python.sh"

pip install --quiet --upgrade powerline-status

source "$INIT_REPO/shared/cli/tmux.sh"
source "$INIT_REPO/shared/lang/java.sh"
source "$INIT_REPO/shared/lang/nodejs.sh"
source "$INIT_REPO/shared/gui/chrome.sh"
source "$INIT_REPO/shared/gui/firefox.sh"
source "$INIT_REPO/shared/gui/vlc.sh"
source "$INIT_REPO/shared/gui/vscode.sh"
source "$INIT_REPO/shared/gui/sourcetree.sh"
source "$INIT_REPO/shared/gui/libreoffice.sh"

if [[ "$OSTYPE" == "darwin"* ]]; then
    source "$INIT_REPO/mac/extra.sh"
elif [[ "$OSTYPE" == "msys"* ]]; then
    source "$INIT_REPO/win/extra.sh"
fi
