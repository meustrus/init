#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

test -x "$(command -v smerge)" || (
    SublimeMergeZip=$(mktemp).zip
    curl -L -o "$SublimeMergeZip" https://download.sublimetext.com/sublime_merge_build_1084_x64.zip
    unzip -oq "$SublimeMergeZip" -d "$BENCH/apps/SublimeMerge"

    printf '#!/bin/sh\n\n"$BENCH/apps/SublimeMerge/smerge" $*\n' > "$BENCH/bin/smerge"
    printf '@CALL "%%%%BENCH%%%%/apps/SublimeMerge/smerge" %%*\n' > "$BENCH/bin/smerge.bat"
)
