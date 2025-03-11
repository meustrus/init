#!/bin/sh

## Color Codes
COLORS=`tput colors 2>/dev/null`
CEsc=`printf '\033'`
if test -n "$COLORS" && test "$COLORS" -ge 8; then
    export CReset="${CEsc}[0m"

    export CGood="${CReset}${CEsc}[1m${CEsc}[36m"  # Bright Cyan
    export CInfo="${CReset}${CEsc}[34m"            # Blue
    export CWarn="${CReset}${CEsc}[1m${CEsc}[33m"  # Bright Yellow
    export CErr="${CReset}${CEsc}[1m${CEsc}[31m"   # Bright Red
    export CEnv="${CReset}${CEsc}[1m${CEsc}[35m"   # Bright Magenta
    export CSide="${CReset}${CEsc}[1m${CEsc}[30m"  # Bright Black (Gray)
    export CHelp="${CReset}${CEsc}[32m"            # Green

    if test "$COLORS" -ge 256; then
        export CGood="${CReset}${CEsc}[38;5;87m"   # Light Cyan
        export CInfo="${CReset}${CEsc}[38;5;28m"   # Dark Green
        export CWarn="${CReset}${CEsc}[38;5;11m"   # Light Yellow
        export CErr="${CReset}${CEsc}[38;5;202m"   # Orange
        export CEnv="${CReset}${CEsc}[38;5;13m"    # Light Magenta
        export CSide="${CReset}${CEsc}[38;5;238m"  # Bright Black (Gray)
    fi
fi
cprint() {
    printf '%sGood\n%sInfo\n%sWarn\n%sErr\n%sEnv\n%sSide\n%sHelp\n%s' \
        "$CGood" "$CInfo" "$CWarn" "$CErr" "$CEnv" "$CSide" "$CHelp" "$CReset"
}

## Prompt
INITRC_PROMPT_COMMAND="\
    export PS1=\"\\\\n\\\\[${CInfo}\\\\]\\\\s \${debian_chroot:+(\${debian_chroot}) }\" && \
    export PS1=\"\${PS1}\\\\[${CGood}\\\\]\\\\u\\\\[${CSide}\\\\]@\\\\[${CEnv}\\\\]\\\\h\\\\[${CReset}\\\\]\" && \
    export PS1=\"\${PS1} \\\\[${CSide}\\\\]:\\\\[${CReset}\\\\] \\\\[${CHelp}\\\\]\\\\w\\\\[${CReset}\\\\]\" && \
    export PS1=\"\${PS1} \`bracketcolors withtimeout 0.5 gss || printf \\\"\\\\[%s\\\\][???]\\\" \\\"${CErr}\\\"\`\\\\[${CReset}\\\\]\" && \
    export PS1=\"\${PS1}\\\\n\\\\[${CSide}\\\\]\\\\\$\\\\[${CReset}\\\\] \"\
"
case "$PROMPT_COMMAND" in
    *"$INITRC_PROMPT_COMMAND"*) ;;
    *)
        export PROMPT_COMMAND=$(printf '%s\n' "$PROMPT_COMMAND" "$INITRC_PROMPT_COMMAND")
    ;;
esac

if test -n "$ZSH_VERSION"; then
    eval_prompt_command() {
        export PROMPT=$'\n'"%{${CInfo}%}%N ${debian_chroot:+(${debian_chroot}) }"
        export PROMPT="${PROMPT}%{${CGood}%}%n%{${CSide}%}@%{${CEnv}%}%m%{${CReset}%} "
        export PROMPT="${PROMPT}%{${CSide}%}:%{${CReset}%} %{${CHelp}%}%~%{${CReset}%} "
        export PROMPT="${PROMPT}`bracketcolors withtimeout 0.5 gss || printf \"%%{%s%%}[???]\" \"${CErr}\"`%{${CReset}%}"
        export PROMPT="${PROMPT}"$'\n'"%{${CSide}%}%#%{${CReset}%} "
    }
    typeset -a precmd_functions
    # append the function to our array of precmd functions
    precmd_functions+=(eval_prompt_command)
fi

## Setup
echoAlias() { alias $1="echoAndRun '$2'" ; }
echoAndRun() { local cmd=$1 ; shift ; printf '%s\n' "$cmd" 1>&2 ; eval "${cmd} <&0" ; }


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
export BRACKETCOLORS_START='\['
export BRACKETCOLORS_END='\]'
if test -n "$ZSH_VERSION"; then
    export BRACKETCOLORS_START='%{'
    export BRACKETCOLORS_END='%}'
fi
bracketcolors() {
    if [ "$#" -lt 1 ]; then
        printf 'Usage: bracketcolors cmd [args...]\n' 1>&2
        return 1
    fi

    local input
    input=`$*`
    local captured_status=$?
    if [ -n "$input" ]; then
        local bracketstate=out
        while IFS='' getopts ':' opt "-$input"; do
            if [ "${OPTARG:-:}" = "$CEsc" ]; then
                [ "$bracketstate" = "out" ] && printf '%s' "$BRACKETCOLORS_START" || true
                bracketstate=in
            elif [ "$bracketstate" = "end" ]; then
                printf '%s' "$BRACKETCOLORS_END"
                bracketstate=out
            elif [ "$bracketstate" = "in" ] && [ "${OPTARG:-:}" = "m" ]; then
                bracketstate=end
            fi
            printf '%s' "${OPTARG:-:}"
        done
        [ "$bracketstate" = "end" ] && printf '%s' "$BRACKETCOLORS_END" || true
    fi
    return $captured_status
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

if ! test -x killall ; then
    echoAlias killall 'test -n "$1" && ps -A | grep "$1" | cut -d" " -f1 | xargs kill'
fi

echoAlias npm-unlink 'npm rm --global $*'
echoAlias find-symlinks 'find -L . -xtype l -ls'
echoAlias reload '. ~/.bashrc'
echoAlias strip-colors 'sed "s/\\x1B\\[[0-9\\;]\\{1,\\}[A-Za-z]//g" $*'
echoAlias escape-colors 'sed "s/\\x1B/\\\\033/g" $*'


## Git

echoAlias gam 'git commit --amend --no-edit $* ; git status'
echoAlias gas 'git add --no-ignore-removal $* ; git status'
echoAlias gbg 'git branch -v | awk "/^[ \t]*[^ \t*]+[ \t]+[^ \t]+[ \t]+\[gone\]/ {print \$1}"'
echoAlias gbp 'git branch -v | awk "/^[ \t]*[^ \t*]+[ \t]+[^ \t]+[ \t]+\[gone\]/ {print \$1}" | xargs git branch -d'
echoAlias gci 'git ls-files --others --ignored --exclude-standard --directory | awk "{system(\"rm -r \\\"\" \$0 \"\\\"\")}"'
echoAlias gd  'git diff $*'
echoAlias gds 'git diff --staged $*'
echoAlias gdx 'git diff --name-only --diff-filter=U $*'
echoAlias gf  'git fetch --tags $* ; git status'
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

gurl() {
    branch=`test -n "$1" && echo "$1" || git symbolic-ref --short HEAD`
    remote=`git config branch."$branch".remote`
    url=`git config remote."$remote".url | sed 's!^git@\([^:]\{0,\}\):\(.\{0,\}\)$!https://\1/\2!' | sed 's!\.git$!!'`
    printf "%s/tree/%s\n" "$url" "$branch"
}

gss() {
    if [ -n "$*" ]; then
        while [ -n "$*" ]; do
            if [ -d "$1" ]; then
                pushd "$1" >/dev/null 2>&1
                printf "%s %s\n" "$1" "`gss`"
                popd >/dev/null 2>&1
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
                    match($0, /(No commits yet|Initial commit) on (.+)|no branch|((\.?[^. ])+)(\.\.\.([^ ]+))? *(\[(ahead ([0-9]+))?[, ]*(behind ([0-9]+))?[, ]*(gone)?\])?/, arr);
                    if (arr[2]) print "branch="arr[2]
                    if (arr[3]) print "branch="arr[3]
                    if (arr[6]) print "remote="arr[6]
                    if (arr[9]) print "ahead="arr[9]
                    if (arr[11]) print "behind="arr[11]
                    if (arr[12]) print "gone="arr[12]
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
    [ "$ahead" -ne "0" ] && info="${info}+${ahead}"
    [ ! -z "$remote" ] && info="${info} ${gone:+${CErr}!}-> ${remote}${color}"
    [ "$behind" -ne "0" ] && info="${info}+${behind# }"

    local extra=
    [ "$staged" -ne "0" ] && extra="${extra} ${CInfo}*${staged}${color}"
    [ "$changed" -ne "0" ] && extra="${extra} ${CWarn}!${changed}${color}"
    [ "$untracked" -ne "0" ] && extra="${extra} ${CWarn}+${untracked}${color}"
    [ "$deleted" -ne "0" ] && extra="${extra} ${CWarn}-${deleted}${color}"
    [ "$conflicts" -ne "0" ] && extra="${extra} ${CErr}X${conflicts}${color}"

    printf '%s\n' "${color}[ ${info}${extra:+ |${extra}} ]${CReset}"
}
