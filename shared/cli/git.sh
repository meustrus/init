#!/bin/sh

source "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

if [ "$INIT_GITNAME" != "$(${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} git config --global user.name)" ]; then
    ${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} git config --global user.name "$INIT_GITNAME"
    printf 'Your `git config --global user.name` is now "%s"\n' "$INIT_GITNAME"
fi

if [ "$INIT_GITEMAIL" != "$(${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} git config --global user.email)" ]; then
    ${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} git config --global user.email "$INIT_GITEMAIL"
    printf 'Your `git config --global user.email` is now "%s"\n' "$INIT_GITEMAIL"
fi

${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} git config --global format.pretty "%C(green)%h %C(white)%s%n%C(bold yellow)%d%C(reset) %C(magenta)%aD %C(bold cyan)(%ar)%C(bold green) - %an%C(reset)"
${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} git config --global mergetool.keepBackup false
${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} git config --global pull.rebase true
${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} git config --global push.default simple
${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} git config --global color.ui true
${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} git config --global color.diff.meta "cyan"
${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} git config --global color.diff.frag "green bold"
${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} git config --global color.diff.commit "yellow bold"
${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} git config --global color.diff.old "magenta bold"
${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} git config --global color.diff.new "blue bold"
${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} git config --global color.diff.whitespace "magenta reverse"
${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} git config --global color.diff-highlight.oldNormal "166 bold"
${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} git config --global color.diff-highlight.oldHighlight "166 bold 52"
${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} git config --global color.diff-highlight.newNormal "33 bold"
${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} git config --global color.diff-highlight.newHighlight "33 bold 19"

${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} cp -f "$INIT_REPO/shared/config/.gitignore-global" "$BENCH/.gitignore-global"
${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} git config --global core.excludesfile "$BENCH/.gitignore-global"

if printf '%s' "$OSTYPE" | grep -q darwin 2>/dev/null; then
    brew-install diff-so-fancy
    ${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} git config --global pager.diff "diff-so-fancy | less --tabs=4 -RFX"
    ${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} git config --global pager.show "diff-so-fancy | less --tabs=4 -RFX"
fi
