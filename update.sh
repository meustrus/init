#!/bin/sh

source "${INIT_REPO:-$(dirname "$0")}/vars.sh"

source source-impl "update.sh"
