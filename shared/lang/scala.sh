#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

if [ -x "$(command -v sbt)" ]; then
    # mkdir -p "$BENCH/lib/ivy2" "$BENCH/lib/sbt"
    # . install-var SBT_OPTS "-Xmx3g -Xms512M -XX:MaxMetaspaceSize=2048M -XX:-UseGCOverheadLimit -Dsbt.ivy.home=\"$BENCH/lib/ivy2/\" -Divy.home=\"$BENCH/lib/ivy2/\" -Dsbt.boot.directory=\"$BENCH/lib/sbt/\""

    mkdir -p "$HOME/.sbt"
    mkdir -p "$HOME/.sbt/0.13"
    mkdir -p "$HOME/.sbt/1.0"

    touch "$HOME/.sbt/.credentials"
    touch "$HOME/.sbt/.credentials-coursier"
    append 'credentials += Credentials(Path.userHome / ".sbt" / ".credentials")' "$HOME/.sbt/0.13/global.sbt"
    append 'credentials += Credentials(Path.userHome / ".sbt" / ".credentials")' "$HOME/.sbt/1.0/global.sbt"

    . install-var COURSIER_CREDENTIALS "$HOME/.sbt/.credentials-coursier"
    . install-var SBT_CREDENTIALS "$HOME/.sbt/.credentials"
    . install-var SBT_OPTS "-Xmx4g -Xms512m -Xss50m"
else
    printf 'ERROR: SBT not installed!\n' 1>&2
fi
