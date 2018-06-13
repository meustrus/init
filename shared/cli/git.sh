#!/bin/sh

INIT_REPO=${INIT_REPO:-$(cd "$(dirname "$0")/../.." && pwd)}

git config --global pull.rebase true
git config --global core.editor "code --wait --new-window"
git config --global mergetool.keepBackup false
git config --global push.default simple
git config --global color.ui true
git config --global color.diff.meta "cyan"
git config --global color.diff.frag "magenta bold"
git config --global color.diff.commit "yellow bold"
git config --global color.diff.old "166 bold"
git config --global color.diff.new "33 bold"
git config --global color.diff.whitespace "magenta reverse"
git config --global color.diff-highlight.oldNormal "166 bold"
git config --global color.diff-highlight.oldHighlight "166 bold 52"
git config --global color.diff-highlight.newNormal "33 bold"
git config --global color.diff-highlight.newHighlight "33 bold 19"

git config --global core.excludesfile "$INIT_REPO/shared/home/.gitignore-global"

if printf '%s' "$OSTYPE" | grep -q darwin 2>/dev/null; then
    brew list diff-so-fancy >/dev/null 2>&1 || brew install diff-so-fancy
    git config --global pager.diff "diff-so-fancy | less --tabs=4 -RFX"
    git config --global pager.show "diff-so-fancy | less --tabs=4 -RFX"
fi
