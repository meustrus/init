#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

if [ -x "$(command -v sbt)" ]; then
    mkdir -p "$BENCH/lib/ivy2" "$BENCH/lib/sbt"
    install-var SBT_OPTS "-Xmx3g -Xms512M -XX:MaxMetaspaceSize=2048M -XX:-UseGCOverheadLimit -Dsbt.ivy.home=\"$BENCH/lib/ivy2/\" -Divy.home=\"$BENCH/lib/ivy2/\" -Dsbt.boot.directory=\"$BENCH/lib/sbt/\""

    # credentials += Credentials(Path.userHome / ".sbt" / ".credentials") >> "$HOME/sbt/1.0/plugins/credentials.sbt"
    # echo addSbtPlugin("io.get-coursier" % "sbt-coursier" % "1.0.3") >> "$HOME/sbt/1.0/plugins/plugins.sbt"
    # echo addSbtPlugin("org.ensime" % "sbt-ensime" % "2.5.1") >> "$HOME/sbt/1.0/plugins/plugins.sbt"
else
    printf 'ERROR: Scala not installed!\n' 1>&2
fi
