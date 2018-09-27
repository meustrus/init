#!/bin/sh

source "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

if [ -x "$(command -v code)" ] && [ -d "$APPDATA" ]; then
    mkdir -p "$APPDATA/Code/User/"
    copy-impl "etc/vscode-settings.json" "$APPDATA/Code/User/settings.json"
    copy-impl "etc/vscode-keybindings.json" "$APPDATA/Code/User/keybindings.json"

    git config --global core.editor "code --wait --new-window"
    git config --global diff.tool code
    git config --global merge.tool code
    git config --global difftool.code.cmd "code --wait --new-window --diff \$LOCAL \$REMOTE"
    git config --global mergetool.code.cmd "code --wait --new-window \$MERGED"

    code \
        --install-extension    formulahendry.auto-close-tag \
        --install-extension         stayfool.vscode-asciidoc \
        --install-extension        jetmartin.bats \
        --install-extension       aaron-bond.better-comments \
        --install-extension        ms-vscode.csharp \
        --install-extension          eamodio.gitlens \
        --install-extension         eriklynd.json-tools \
        --install-extension christian-kohler.npm-intellisense \
        --install-extension          tootone.org-mode \
        --install-extension        ms-python.python \
        --install-extension      mechatroner.rainbow-csv \
        --install-extension         rebornix.ruby \
        --install-extension      itryapitsin.sbt \
        --install-extension           dragos.scala-lsp \
        --install-extension      craigthomas.supersharp \
        --install-extension  robertohuertasm.vscode-icons \
        --install-extension          vscjava.vscode-java-pack \
        --install-extension   DotJoshJohnson.xml \
        ;
elif [ -x "$(command -v code)" ]; then
    printf 'ERROR: $APPDATA is not a valid directory, but Visual Studio Code init requires it\n' 1>&2
else
    printf 'ERROR: `code` is not on $PATH, but Visual Studio Code init requires it\n' 1>&2
fi
