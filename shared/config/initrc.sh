#!/bin/sh

## Color Codes
COLORS=$(tput colors 2>/dev/null)
if test -n "$COLORS" && test "$COLORS" -ge 8; then
    export CReset=$'\033[0m'

    export CGood="$CReset"$'\033[1m\033[36m'            # Bold Cyan
    export CInfo="$CReset"$'\033[35m'                   # Magenta
    export CWarn="$CReset"$'\033[1m\033[33m'            # Bold Yellow
    export CErr="$CReset"$'\033[1m\033[31m'             # Bold Red
    export CEnv="$CReset"$'\033[37m'                    # White
    export CSide="$CReset"$'\033[34m'                   # Blue
    export CHelp="$CReset"$'\033[32m'                   # Green

    if test "$COLORS" -ge 16; then
        export CInfo="$CReset"$'\033[38;5;13m'          # Light Magenta
        export CSide="$CReset"$'\033[38;5;8m'           # Dark Grey
    fi

    if test "$COLORS" -ge 256; then
        export CWarn="$CReset"$'\033[1m\033[38;5;202m'  # Bold Orange
        export CEnv="$CReset"$'\033[38;5;27m'           # Blue
        export CSide="$CReset"$'\033[38;5;28m'          # Dark Green
    fi
fi

## Prompt
PS1='\n${CEnv}\s ${debian_chroot:+($debian_chroot) }${CGood}\u${CSide}@${CInfo}\h${CReset} : ${CHelp}\w${CReset} `withtimeout 0.5 gss || printf "${CErr}[???]"`${CReset}\n\$ '


## Navigation
alias ls="ls -F -A"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."


## Utility
withtimeout() {
    if [ "$#" -lt 2 ]; then
        printf "Usage: withtimeout #seconds cmd [args...]\n"
        exit 1
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

alias npm-unlink="npm rm --global"
alias find-symlinks="find -L . -xtype l -ls"


## Git

GIT_LOG_FORMAT="%C(bold cyan)%h%C(reset) %C(white)%s%C(cyan) - %an%n         %C(bold yellow)%d%C(reset) %C(green)%aD %C(bold)(%ar)%C(reset)"

gam() { git commit --amend --no-edit $* ; git status ; }
gas() { git add --no-ignore-removal $* ; git status ; }
gd () { git diff --break-rewrites --color $* ; }
gds() { git diff --break-rewrites --color --staged $* ; }
gdx() { git diff --break-rewrites --color --name-only --diff-filter=U $* ; }
gf () { git fetch --all --prune --tags $* ; git status ; }
gff() { git merge --ff-only $* ; git status ; }
gl () { git log --all --graph --decorate --date=relative --format=format:"$GIT_LOG_FORMAT" $* ; }
gla() { git log --all --graph --decorate --date=relative --format=format:"$GIT_LOG_FORMAT" --author-date-order $* ; }
glo() { git fsck --connectivity-only | grep '^dangling commit' | cut -d ' ' -f 3 | xargs -n1 git log -1 --date=relative --format=format:"$GIT_LOG_FORMAT" ; }
gr () { git rebase $* ; git status ; }
gra() { git rebase --abort ; git status ; }
grc() { git rebase --continue ; git status ; }
gri() { git rebase --interactive $* ; git status ; }
grt() { git rev-parse --show-toplevel ; }
gst() { git status $* ; }
gun() { git reset --soft HEAD~ ; }

gss() {
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
                declare $(printf "${line:3}" | gawk '{
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

    printf "${color}[ $info${extra:+ |$extra} ]$CReset\n"
}
