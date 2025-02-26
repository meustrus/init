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

git config --global column.ui auto
git config --global init.defaultBranch main
git config --global diff.algorithm histogram
git config --global diff.colorMoved zebra
git config --global diff.mnemonicPrefix true
git config --global diff.renames true
git config --global fetch.all true
git config --global fetch.prune true
git config --global fetch.pruneTags true
git config --global format.pretty "%C(green)%h %C(white)%s%n%C(bold yellow)%d%C(reset) %C(magenta)%aD %C(bold cyan)(%ar)%C(bold green) - %an%C(reset)"
git config --global merge.conflictStyle zdiff3
git config --global mergetool.keepBackup false
git config --global pull.rebase true
git config --global push.default simple
git config --global rebase.autoSquash true
git config --global rebase.autoStash true
git config --global tag.sort version:refname
git config --global color.ui true
git config --global color.diff.meta "cyan"
git config --global color.diff.frag "blue bold"
git config --global color.diff.commit "yellow bold"
git config --global color.diff.old "magenta bold"
git config --global color.diff.oldMoved "magenta bold reverse"
git config --global color.diff.oldMovedAlternative "166 bold reverse"
git config --global color.diff.new "green bold"
git config --global color.diff.newMoved "green bold reverse"
git config --global color.diff.newMovedAlternative "33 bold reverse"
git config --global color.diff.whitespace "white dim reverse"
git config --global color.diff-highlight.oldNormal "magenta bold"
git config --global color.diff-highlight.oldHighlight "magenta bold reverse"
git config --global color.diff-highlight.newNormal "green bold"
git config --global color.diff-highlight.newHighlight "green bold reverse"

copy-impl "etc/.gitignore-global" "$BENCH/.gitignore-global"
git config --global core.excludesfile "$BENCH/.gitignore-global"

curl -L -o "$BENCH/bin/diff-so-fancy" https://github.com/so-fancy/diff-so-fancy/releases/latest/download/diff-so-fancy
chmod a+x "$BENCH/bin/diff-so-fancy"
git config --global color.pager true
git config --global pager.diff "diff-so-fancy | less --tabs=4 -RFX"
git config --global pager.show "diff-so-fancy | less --tabs=4 -RFX"
