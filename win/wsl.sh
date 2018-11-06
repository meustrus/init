#!/bin/sh

powershell -c 'Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux'
# may need to restart here?

# different for non-Intel; would need to check arch to support others
Debian=$(mktemp).zip
curl -L -o "$Debian" https://aka.ms/wsl-debian-gnulinux
unzip -oq "$Debian" -d "$BENCH/debian"

printf '#!/bin/sh\n$BENCH/debian/debian.exe $*\n' > "$BENCH/bin/debian"
printf '@%%BENCH%%\\debian\\debian.exe %%*\r\n' > "$BENCH/bin/debian.bat"
chmod a+x "$BENCH/bin/debian"
