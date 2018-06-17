#!/bin/sh

INIT_REPO=${INIT_REPO:-$(cd "$(dirname "$0")/../.." && pwd)}
source "$INIT_REPO/shared/vars.sh"

export NVM_DIR=${NVM_DIR:-$BENCH/lib/.nvm}
${SUDO_USER:+sudo -u "$SUDO_USER"} mkdir -p "$NVM_DIR"

if printf '%s' "$OSTYPE" | grep -q darwin 2>/dev/null; then
    sh "$INIT_REPO/mac/bin/brew-install.sh" nvm

    source $(${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} brew --prefix nvm)/nvm.sh

    sh "$INIT_REPO/shared/bin/append" "# NVM\nexport NVM_DIR=\"$NVM_DIR\"\nsource \$(brew --prefix nvm)/nvm.sh" "$HOME/.profile"
    sh "$INIT_REPO/shared/bin/append" "# NVM\nexport NVM_DIR=\"$NVM_DIR\"\nsource \$(brew --prefix nvm)/nvm.sh" "$HOME/.bash_profile"
    sh "$INIT_REPO/shared/bin/append" "# NVM\nexport NVM_DIR=\"$NVM_DIR\"\nsource \$(brew --prefix nvm)/nvm.sh" "$HOME/.zprofile"
elif printf '%s' "$OSTYPE" | grep -q msys 2>/dev/null; then
    choco install nvm -y
    setx NVM_DIR "$NVM_DIR"
fi

${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} nvm install node
${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} nvm install node --reinstall-packages-from=node
${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} nvm use node
