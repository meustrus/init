#!/bin/sh

## Color Codes
COLORS=$(tput colors 2>/dev/null)
if test -n "$COLORS" && test "$COLORS" -ge 8; then
    CReset=$'\033[0m' export CReset

    CGood="$CReset"$'\033[1m\033[36m'       export CGood # Bright Cyan
    CInfo="$CReset"$'\033[37m'              export CInfo # White
    CWarn="$CReset"$'\033[1m\033[33m'       export CWarn # Bright Yellow
    CErr="$CReset"$'\033[1m\033[31m'        export CErr  # Bright Red
    CEnv="$CReset"$'\033[35m'               export CEnv  # Magenta
    CSide="$CReset"$'\033[34m'              export CSide # Blue
    CHelp="$CReset"$'\033[32m'              export CHelp # Green

    if test "$COLORS" -ge 256; then
        CGood="$CReset"$'\033[38;5;87m'     export CGood # Light Cyan
        CInfo="$CReset"$'\033[34m'          export CInfo # Blue
        CWarn="$CReset"$'\033[38;5;11m'     export CWarn # Light Yellow
        CErr="$CReset"$'\033[38;5;202m'     export CErr  # Orange
        CEnv="$CReset"$'\033[38;5;13m'      export CEnv  # Light Magenta
        CSide="$CReset"$'\033[38;5;28m'     export CSide # Dark Green
    fi
fi
cprint() {
    printf '%sGood\n%sInfo\n%sWarn\n%sErr\n%sEnv\n%sSide\n%sHelp\n%s' \
        "$CGood" "$CInfo" "$CWarn" "$CErr" "$CEnv" "$CSide" "$CHelp" "$CReset"
}

## Prompt
PS1='\n${CInfo}\s ${debian_chroot:+($debian_chroot) }${CGood}\u${CSide}@${CEnv}\h${CReset} : ${CHelp}\w${CReset} `withtimeout 0.5 gss || printf "${CErr}[???]"`${CReset}\n\$ '


## Setup
echoAlias() { alias $1="echoAndRun '$2'" ; }
echoAndRun() { local cmd=$1 ; shift ; printf '%s\n' "$cmd" 1>&2 ; eval $cmd ; }


## Navigation
alias ls="printf 'ls -F -A \$*\n' 1>&2 ; ls -F -A"
echoAlias cdb 'cd "$BENCH"'
echoAlias .. 'cd ..'
echoAlias ... 'cd ../..'
echoAlias .... 'cd ../../..'
echoAlias ..... 'cd ../../../..'
echoAlias ...... 'cd ../../../../..'
echoAlias ....... 'cd ../../../../../..'
echoAlias ........ 'cd ../../../../../../..'


## Utility
withtimeout() {
    if [ "$#" -lt 2 ]; then
        printf "Usage: withtimeout #seconds cmd [args...]\n" 1>&2
        return 1
    fi

    (
        WAIT="$1"
        shift

        ( $@ ) &
        CMD_PID=$!

        (
            sleep $WAIT >/dev/null 2>&1 &
            wait $!
            kill $CMD_PID >/dev/null 2>&1
        ) &
        SLEEP_PID=$!

        wait $CMD_PID 2>/dev/null
        RESULT=$?
        kill $SLEEP_PID >/dev/null 2>&1
        return $RESULT
    )
}

echoAlias npm-unlink 'npm rm --global'
echoAlias find-symlinks 'find -L . -xtype l -ls'
echoAlias reload 'source ~/.bashrc'
echoAlias strip-colors "sed 's/\x1B\[[0-9;]\+[A-Za-z]//g' "
echoAlias escape-colors "sed 's/\x1B/\\\\033/g'"


## Git

echoAlias gam 'git commit --amend --no-edit $* ; git status'
echoAlias gas 'git add --no-ignore-removal $* ; git status'
echoAlias gbg 'git branch -v | awk "/^[ \t]*[^ \t*]+[ \t]+[^ \t]+[ \t]+\[gone\]/ {print \$1}"'
echoAlias gbp 'git branch -v | awk "/^[ \t]*[^ \t*]+[ \t]+[^ \t]+[ \t]+\[gone\]/ {print \$1}" | xargs git branch -d'
echoAlias gd  'git diff --break-rewrites --color $*'
echoAlias gds 'git diff --break-rewrites --color --staged $*'
echoAlias gdx 'git diff --break-rewrites --color --name-only --diff-filter=U $*'
echoAlias gf  'git fetch --all --prune --tags $* ; git status'
echoAlias gff 'git merge --ff-only $* ; git status'
echoAlias gl  'git log --all --graph --decorate --date=relative $*'
echoAlias gla 'git log --all --graph --decorate --date=relative --author-date-order $*'
echoAlias glo 'git fsck --connectivity-only | grep "^dangling commit" | cut -d " " -f 3 | xargs -n1 git log -1 --date=relative'
echoAlias gr  'git rebase $* ; git status'
echoAlias gra 'git rebase --abort'
echoAlias grc 'git rebase --continue'
echoAlias gri 'git rebase --interactive $*'
echoAlias grt 'git rev-parse --show-toplevel'
echoAlias gst 'git status $*'
echoAlias gun 'printf "To redo this commit, run: git reset --soft " ; git rev-parse HEAD ; git reset --soft "HEAD~$1"'

gss() {
    if [ "$#" -gt 0 ]; then
        for dir in "$@"; do
            if [ -d "$dir" ]; then
                pushd "$dir" >/dev/null
                printf "%s %s\n" "$dir" "$(gss)"
                popd >/dev/null
            else
                printf "'%s' is not a directory\n" "$dir"
            fi
        done
        return 0
    fi

    local gitstatus
    gitstatus=$(git status --porcelain --branch 2>/dev/null)
    [ "$?" -ne 0 ] && return 0

    local branch=
    local remote=
    local ahead=0
    local behind=0
    local gone=
    local staged=0
    local changed=0
    local untracked=0
    local deleted=0
    local conflicts=0
    while IFS='' read -r line || [ -n "$line" ]; do
        case "${line:0:2}" in
            \#\#)
                declare $(printf '%s' "${line:3}" | gawk '{
                    match($0, /(No commits yet|Initial commit) on (.+)|no branch|([^. ]+)(\.\.\.([^ ]+))? *(\[(ahead ([0-9]+))?[, ]*(behind ([0-9]+))?[, ]*(gone)?\])?/, arr);
                    if (arr[2]) print "branch="arr[2]
                    if (arr[3]) print "branch="arr[3]
                    if (arr[5]) print "remote="arr[5]
                    if (arr[8]) print "ahead="arr[8]
                    if (arr[10]) print "behind="arr[10]
                    if (arr[11]) print "gone="arr[11]
                }')
                ;;
            \?\?) ((untracked++)) ;;
            \!\!) ;;
            U?) ((conflicts++)) ;;
            ?U) ((conflicts++)) ;;
            DD) ((conflicts++)) ;;
            AA) ((conflicts++)) ;;
            \ A) ((changed++)) ;;
            ?M) ((changed++)) ;;
            ?D) ((deleted++)) ;;
            *) ((staged++)) ;;
        esac
    done << EOF
$gitstatus
EOF

    [ -z "$branch" ] && branch=$(git describe --tag --exact-match 2>/dev/null || git rev-parse --abbrev-ref HEAD 2>/dev/null || printf "???")

    local color=$CGood
    [ "$ahead" -ne "0" ] || [ "$staged" -ne "0" ] && color=$CInfo
    [ "$changed" -ne "0" ] || [ "$untracked" -ne "0" ] && color=$CWarn
    [ "$behind" -ne "0" ] || [ "$conflicts" -ne "0" ] && color=$CErr

    local info=$branch
    [ "$ahead" -ne "0" ] && info="$info+$ahead"
    [ ! -z "$remote" ] && info="$info ${gone:+$CErr!}-> $remote$color"
    [ "$behind" -ne "0" ] && info="$info+${behind# }"

    local extra=
    [ "$staged" -ne "0" ] && extra="$extra $CInfo*$staged$color"
    [ "$changed" -ne "0" ] && extra="$extra $CWarn!$changed$color"
    [ "$untracked" -ne "0" ] && extra="$extra $CWarn+$untracked$color"
    [ "$deleted" -ne "0" ] && extra="$extra $CWarn-$deleted$color"
    [ "$conflicts" -ne "0" ] && extra="$extra ${CErr}X$conflicts$color"

    printf '%s\n' "${color}[ $info${extra:+ |$extra} ]$CReset"
}
