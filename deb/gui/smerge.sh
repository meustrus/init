#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

if ! test -f /etc/apt/sources.list.d/sublime-text.list; then
    apt-install apt-transport-https
    wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
    echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list >/dev/null
    sudo apt update
fi

apt-install libgtk2.0-0 sublime-merge

printf '#!/bin/sh\n\nsublime-merge $*\n' > "$BENCH/bin/smerge"
chmod a+x "$BENCH/bin/smerge"
