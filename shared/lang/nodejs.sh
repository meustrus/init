#!/bin/sh

source "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

export NVM_DIR=${NVM_DIR:-$BENCH/lib/.nvm}
${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} mkdir -p "$NVM_DIR"

if printf '%s' "$OSTYPE" | grep -q darwin 2>/dev/null; then
    brew-install nvm

    source $(${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} brew --prefix nvm)/nvm.sh

    append "# NVM\nexport NVM_DIR=\"$NVM_DIR\"\nsource \$(brew --prefix nvm)/nvm.sh" "$HOME/.profile"
    append "# NVM\nexport NVM_DIR=\"$NVM_DIR\"\nsource \$(brew --prefix nvm)/nvm.sh" "$HOME/.bash_profile"
    append "# NVM\nexport NVM_DIR=\"$NVM_DIR\"\nsource \$(brew --prefix nvm)/nvm.sh" "$HOME/.zprofile"
elif printf '%s' "$OSTYPE" | grep -q msys 2>/dev/null; then
    choco install nvm -y
    setx NVM_DIR "$NVM_DIR"
fi

${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} nvm install node
${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} nvm install node --reinstall-packages-from=node
${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} nvm use node
