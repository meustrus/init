#!/bin/sh

INIT_REPO=${INIT_REPO:-$(cd "$(dirname "$0")/.." && pwd)}
MAC_APPS=${MAC_APPS:-~/Applications}

source "$INIT_REPO/mac/brew.sh"
