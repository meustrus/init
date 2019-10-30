#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

if [ -x "$(command -v code)" ] && [ -d "$APPDATA" ]; then
    mkdir -p "$APPDATA/Code/User/"
    copy-impl "etc/vscode-settings.json" "$APPDATA/Code/User/settings.json"
    copy-impl "etc/vscode-keybindings.json" "$APPDATA/Code/User/keybindings.json"

    git config --global core.editor "code --wait --new-window"
    git config --global diff.tool code
    git config --global merge.tool code
    git config --global difftool.code.cmd "code --wait --new-window --diff \$LOCAL \$REMOTE"
    git config --global mergetool.code.cmd "code --wait --new-window \$MERGED"

    yes 0 | code \
        --install-extension            ryu1kn.annotator \
        --install-extension         jetmartin.bats \
        --install-extension        aaron-bond.better-comments \
        --install-extension         marlon407.code-groovy \
        --install-extension         ms-vscode.csharp \
        --install-extension       alexkrechik.cucumberautocomplete \
        --install-extension      editorconfig.editorconfig \
        --install-extension            sohibe.java-generate-setters-getters \
        --install-extension          eriklynd.json-tools \
        --install-extension            yzhang.markdown-all-in-one \
        --install-extension         scalameta.metals \
        --install-extension  christian-kohler.npm-intellisense \
        --install-extension         adammaras.overtype \
        --install-extension         ms-python.python \
        --install-extension              2gua.rainbow-brackets \
        --install-extension       mechatroner.rainbow-csv \
        --install-extension             humao.rest-client \
        --install-extension          rebornix.ruby \
        --install-extension       itryapitsin.sbt \
        --install-extension              mtxr.sqltools \
        --install-extension       craigthomas.supersharp \
        --install-extension              jock.svg \
        --install-extension             mauve.terraform \
        --install-extension           flesler.url-encode \
        --install-extension          karb0f0s.vbscript \
        --install-extension          stayfool.vscode-asciidoc \
        --install-extension      adamhartford.vscode-base64 \
        --install-extension           aeschli.vscode-css-formatter \
        --install-extension         slevesque.vscode-hexdump \
        --install-extension vscode-icons-team.vscode-icons \
        --install-extension           vscjava.vscode-java-pack \
        --install-extension         ms-vscode.wordcount \
        --install-extension    DotJoshJohnson.xml \
        ;
elif [ -x "$(command -v code)" ]; then
    printf 'ERROR: $APPDATA is not a valid directory, but Visual Studio Code init requires it\n' 1>&2
else
    printf 'ERROR: `code` is not on $PATH, but Visual Studio Code init requires it\n' 1>&2
fi
