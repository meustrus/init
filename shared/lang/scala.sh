#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

if [ -x "$(command -v sbt)" ]; then
    # mkdir -p "$BENCH/lib/ivy2" "$BENCH/lib/sbt"
    # . install-var SBT_OPTS "-Xmx3g -Xms512M -XX:MaxMetaspaceSize=2048M -XX:-UseGCOverheadLimit -Dsbt.ivy.home=\"$BENCH/lib/ivy2/\" -Divy.home=\"$BENCH/lib/ivy2/\" -Dsbt.boot.directory=\"$BENCH/lib/sbt/\""

    touch "$HOME/.sbt/.credentials"
    touch "$HOME/.sbt/.credentials-coursier"
    echo 'credentials += Credentials(Path.userHome / ".sbt" / ".credentials")' >> "$HOME/.sbt/0.13/global.sbt"
    echo 'credentials += Credentials(Path.userHome / ".sbt" / ".credentials")' >> "$HOME/.sbt/1.0/global.sbt"

    . install-var COURSIER_CREDENTIALS "$HOME/.sbt/.credentials-coursier"
    . install-var SBT_CREDENTIALS "$HOME/.sbt/.credentials"
    . install-var SBT_OPTS "-Xmx4g -Xms512M"
else
    printf 'ERROR: SBT not installed!\n' 1>&2
fi
