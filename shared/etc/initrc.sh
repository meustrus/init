#!/bin/sh

## Color Codes
COLORS=`tput colors 2>/dev/null`
CEsc=`printf '\033'`
if test -n "$COLORS" && test "$COLORS" -ge 8; then
    CReset="$CEsc[0m" export CReset

    CGood="$CReset$CEsc[1m$CEsc[36m"    export CGood # Bright Cyan
    CInfo="$CReset$CEsc[34m"            export CInfo # Blue
    CWarn="$CReset$CEsc[1m$CEsc[33m"    export CWarn # Bright Yellow
    CErr="$CReset$CEsc[1m$CEsc[31m"     export CErr  # Bright Red
    CEnv="$CReset$CEsc[1m$CEsc[35m"     export CEnv  # Bright Magenta
    CSide="$CReset$CEsc[1m$CEsc[30m"    export CSide # Bright Black (Gray)
    CHelp="$CReset$CEsc[32m"            export CHelp # Green

    if test "$COLORS" -ge 256; then
        CGood="$CReset$CEsc[38;5;87m"   export CGood # Light Cyan
        CInfo="$CReset$CEsc[38;5;28m"   export CInfo # Dark Green
        CWarn="$CReset$CEsc[38;5;11m"   export CWarn # Light Yellow
        CErr="$CReset$CEsc[38;5;202m"   export CErr  # Orange
        CEnv="$CReset$CEsc[38;5;13m"    export CEnv  # Light Magenta
    fi
fi
cprint() {
    printf '%sGood\n%sInfo\n%sWarn\n%sErr\n%sEnv\n%sSide\n%sHelp\n%s' \
        "$CGood" "$CInfo" "$CWarn" "$CErr" "$CEnv" "$CSide" "$CHelp" "$CReset"
}

## Prompt
PROMPT_COMMAND="PS1=\"\\\\n\\\\[$CInfo\\\\]\\\\s \${debian_chroot:+(\$debian_chroot) }\
\\\\[$CGood\\\\]\\\\u\\\\[$CSide\\\\]@\\\\[$CEnv\\\\]\\\\h\\\\[$CReset\\\\]\
 \\\\[$CSide\\\\]:\\\\[$CReset\\\\] \\\\[$CHelp\\\\]\\\\w\\\\[$CReset\\\\]\
 \`bracket-colors withtimeout 0.5 gss || printf \\\"\\\\[%s\\\\][???]\\\" \\\"$CErr\\\"\`\\\\[$CReset\\\\]\
\\\\n\\\\[$CSide\\\\]\\\\\$\\\\[$CReset\\\\] \""


## Setup
echoAlias() { alias $1="echoAndRun '$2'" ; }
echoAndRun() { local cmd=$1 ; shift ; printf '%s\n' "$cmd" 1>&2 ; eval "$cmd <&0" ; }


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
bracket-colors() {
    if [ "$#" -lt 1 ]; then
        printf 'Usage: bracket-colors cmd [args...]\n' 1>&2
        return 1
    fi

    local input
    input=`$*`
    local status=$?
    if [ -n "$input" ]; then
        local bracketstate=out
        while IFS='' read -r -n1 -d '' char; do
            if [ "$char" == "$CEsc" ]; then
                [ "$bracketstate" == "out" ] && printf '\[' || true
                bracketstate=in
            elif [ "$bracketstate" == "end" ]; then
                printf '\]'
                bracketstate=out
            elif [ "$bracketstate" == "in" ] && [ "$char" == "m" ]; then
                bracketstate=end
            fi
            printf '%s' "$char"
        done << EOF
$input
EOF
        [ "$bracketstate" == "end" ] && printf '\\]' || true
    fi
    return $status
}
withtimeout() {
    if [ "$#" -lt 2 ]; then
        printf "Usage: withtimeout #seconds cmd [args...]\n" 1>&2
        return 1
    fi

    (
        WAIT="$1"
        shift

        ( $* ) &
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
echoAlias strip-colors 'sed "s/\\x1B\\[[0-9\\;]\\+[A-Za-z]//g" $*'
echoAlias escape-colors 'sed "s/\\x1B/\\\\033/g" $*'


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
    if [ -n "$*" ]; then
        while [ -n "$*" ]; do
            if [ -d "$1" ]; then
                pushd "$1" >/dev/null
                printf "%s %s\n" "$1" "`gss`"
                popd >/dev/null
            else
                printf "'%s' is not a directory\n" "$1" 1>&2
            fi
            shift
        done
        return 0
    fi

    local gitstatus
    gitstatus=`git status --porcelain --branch 2>/dev/null`
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
                declare `printf '%s' "${line:3}" | gawk '{
                    match($0, /(No commits yet|Initial commit) on (.+)|no branch|([^. ]+)(\.\.\.([^ ]+))? *(\[(ahead ([0-9]+))?[, ]*(behind ([0-9]+))?[, ]*(gone)?\])?/, arr);
                    if (arr[2]) print "branch="arr[2]
                    if (arr[3]) print "branch="arr[3]
                    if (arr[5]) print "remote="arr[5]
                    if (arr[8]) print "ahead="arr[8]
                    if (arr[10]) print "behind="arr[10]
                    if (arr[11]) print "gone="arr[11]
                }'`
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

    [ -z "$branch" ] && branch=`git describe --tag --exact-match 2>/dev/null || git rev-parse --abbrev-ref HEAD 2>/dev/null || printf "???"`

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
