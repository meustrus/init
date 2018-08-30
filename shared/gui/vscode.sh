#!/bin/sh

source "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

finalizeVSCode() {
    ${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} cp -f "$INIT_REPO/shared/config/vscode-settings.json" "$1/settings.json"
    ${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} cp -f "$INIT_REPO/shared/config/vscode-keybindings.json" "$1/keybindings.json"

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
}

if printf '%s' "$OSTYPE" | grep -q darwin 2>/dev/null; then
    brew-cask-install visual-studio-code
    finalizeVSCode "$HOME/Library/Application Support/Code/User"
elif printf '%s' "$OSTYPE" | grep -q msys 2>/dev/null; then
    choco install vscode -y
    finalizeVSCode "$APPDATA/Code/User/"
fi
