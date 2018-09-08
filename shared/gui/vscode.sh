#!/bin/sh

source "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

if [ -x "$(command -v code)" ] && [ -d "$APPDATA" ]; then
    ${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} mkdir -p "$APPDATA/Code/User/"
    copy-impl "etc/vscode-settings.json" "$APPDATA/Code/User/settings.json"
    copy-impl "etc/vscode-keybindings.json" "$APPDATA/Code/User/keybindings.json"

    ${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} git config --global core.editor "code --wait --new-window"
    ${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} git config --global diff.tool code
    ${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} git config --global merge.tool code
    ${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} git config --global difftool.code.cmd "code --wait --new-window --diff \$LOCAL \$REMOTE"
    ${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} git config --global mergetool.code.cmd "code --wait --new-window \$MERGED"

    ${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} code --install-extension    formulahendry.auto-close-tag
    ${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} code --install-extension       aaron-bond.better-comments
    ${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} code --install-extension        ms-vscode.csharp
    ${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} code --install-extension     donjayamanne.githistory
    ${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} code --install-extension christian-kohler.npm-intellisense
    ${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} code --install-extension        ms-python.python
    ${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} code --install-extension      mechatroner.rainbow-csv
    ${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} code --install-extension         rebornix.ruby
    ${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} code --install-extension      itryapitsin.sbt
    ${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} code --install-extension           dragos.scala-lsp
    ${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} code --install-extension      craigthomas.supersharp
    ${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} code --install-extension  robertohuertasm.vscode-icons
    ${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} code --install-extension          vscjava.vscode-java-pack
    ${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} code --install-extension   DotJoshJohnson.xml
elif [ -x "$(command -v code)" ]; then
    printf 'ERROR: $APPDATA is not a valid directory, but Visual Studio Code init requires it\n' 1>&2
else
    printf 'ERROR: `code` is not on $PATH, but Visual Studio Code init requires it\n' 1>&2
fi
