#!/bin/sh

INIT_REPO=${INIT_REPO:-$(cd "$(dirname "$0")/.." && pwd)}

choco install cmder -y
choco install rapidee -y --package-parameters="NoShortcut"
choco install clcl.portable -y
