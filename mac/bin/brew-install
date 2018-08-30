#!/bin/sh

PREFIX=${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"}
$PREFIX brew list "$1" >/dev/null 2>&1 || $PREFIX brew install "$1"
