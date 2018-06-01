#!/bin/sh

INIT_REPO="${INIT_REPO:-$(dirname $0)/..}"

choco install cmder -y
choco install rapidee -y --package-parameters="NoShortcut"
choco install clcl.portable -y
