#!/bin/sh

powershell -c 'Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux'
# may need to restart here?

# different for non-Intel; would need to check arch to support others
UbuntuZipFile=$(mktemp).zip
curl -L -o "$UbuntuZipFile" https://aka.ms/wsl-ubuntu-1804
Expand-Archive "$UbuntuZipFile" "$BENCH/ubuntu1804"

