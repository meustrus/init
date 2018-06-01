#!/bin/sh

INIT_REPO="${INIT_REPO:-$(dirname $0)/..}"

git config --global pull.rebase true
git config --global core.editor "code --wait --new-window"
git config --global mergetool.keepBackup false
git config --global push.default simple
git config --global color.ui true
git config --global color.diff.meta "cyan"
git config --global color.diff.frag "magenta bold"
git config --global color.diff.commit "yellow bold"
git config --global color.diff.old "red bold"
git config --global color.diff.new "blue bold"
git config --global color.diff.whitespace "magenta reverse"
git config --global color.diff-highlight.oldNormal "red bold"
git config --global color.diff-highlight.oldHighlight "red bold 52"
git config --global color.diff-highlight.newNormal "blue bold"
git config --global color.diff-highlight.newHighlight "blue bold 22"

git config --global core.excludesfile "$INIT_REPO/shared/home/.gitignore-global"

if [[ "$OSTYPE" == "darwin"* ]]; then
    brew install diff-so-fancy
    git config --global pager.diff "diff-so-fancy | less --tabs=4 -RFX"
    git config --global pager.show "diff-so-fancy | less --tabs=4 -RFX"
fi
