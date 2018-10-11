#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

if [ "$INIT_GITNAME" != "$(git config --global user.name)" ]; then
    git config --global user.name "$INIT_GITNAME"
    printf 'Your `git config --global user.name` is now "%s"\n' "$INIT_GITNAME"
fi

if [ "$INIT_GITEMAIL" != "$(git config --global user.email)" ]; then
    git config --global user.email "$INIT_GITEMAIL"
    printf 'Your `git config --global user.email` is now "%s"\n' "$INIT_GITEMAIL"
fi

git config --global format.pretty "%C(green)%h %C(white)%s%n%C(bold yellow)%d%C(reset) %C(magenta)%aD %C(bold cyan)(%ar)%C(bold green) - %an%C(reset)"
git config --global mergetool.keepBackup false
git config --global pull.rebase true
git config --global push.default simple
git config --global color.ui true
git config --global color.diff.meta "cyan"
git config --global color.diff.frag "blue bold"
git config --global color.diff.commit "yellow bold"
git config --global color.diff.old "magenta bold"
git config --global color.diff.new "green bold"
git config --global color.diff.whitespace "magenta reverse"
git config --global color.diff-highlight.oldNormal "166 bold"
git config --global color.diff-highlight.oldHighlight "166 bold 52"
git config --global color.diff-highlight.newNormal "33 bold"
git config --global color.diff-highlight.newHighlight "33 bold 19"

copy-impl "etc/.gitignore-global" "$BENCH/.gitignore-global"
git config --global core.excludesfile "$BENCH/.gitignore-global"
