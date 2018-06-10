
## Color Codes
COLORS=$(tput colors 2>/dev/null)
if test -n "$COLORS" && test "$COLORS" -ge 8; then
    CReset=$(tput sgr0)

    CGood="$CReset$(tput bold)$(tput setaf 6)"          # Bold Cyan
    CInfo="$CReset$(tput setaf 5)"                      # Magenta
    CWarn="$CReset$(tput bold)$(tput setaf 3)"          # Bold Yellow
    CErr="$CReset$(tput bold)$(tput setaf 1)"           # Bold Red
    CEnv="$CReset$(tput setaf 7)"                       # White
    CSide="$CReset$(tput setaf 4)"                      # Blue
    CHelp="$CReset$(tput setaf 2)"                      # Green

    if test "$COLORS" -ge 16; then
        CInfo="$CReset$(tput setaf 13)"                 # Light Magenta
        CSide="$CReset$(tput setaf 8)"                  # Dark Grey
    fi

    if test "$COLORS" -ge 256; then
        CWarn="$CReset$(tput bold)$(tput setaf 202)"    # Bold Orange
        CEnv="$CReset$(tput setaf 27)"                  # Blue
        CSide="$CReset$(tput setaf 28)"                 # Dark Green
    fi
fi


## Prompt
PS1='\n${CEnv}\s ${debian_chroot:+($debian_chroot) }${CGood}\u${CSide}@${CInfo}\h${CReset} : ${CHelp}\w${CReset} $(timeout 0.5 gss || printf "${CErr}[???]")\n${CSide}\$${CReset} '


## Navigation
alias ls="ls -F -A"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."


## Utility
timeout() { ( WAIT="$1" ; shift ; ( echo $($@) ) & ( sleep $WAIT ; ! kill $! >/dev/null 2>&1 ) ) ; }

alias npm-unlink="npm rm --global"


## Git

GIT_LOG_FORMAT="%C(bold cyan)%h%C(reset) %C(white)%s%C(cyan) - %an%n         %C(bold yellow)%d%C(reset) %C(green)%aD %C(bold)(%ar)%C(reset)"

gam() { git commit --amend --no-edit ; gst ; }
gas() { git add --no-ignore-removal ; gst ; }
gd () { git diff --break-rewrites --color $* ; }
gdc() { gd --name-only --diff-filter=U $* ; }
gds() { gd --staged $* ; }
gf () { git fetch --all --prune --tags $* ; gst ; }
gff() { git merge --ff-only $* ; gst ; }
gl () { git log --all --graph --decorate --date=relative --format=format:"$GIT_LOG_FORMAT" $* ; }
gla() { gl --author-date-order $* ; }
glo() { git fsck --connectivity-only ; }
gr () { git rebase $* ; gst ; }
gra() { gr --abort ; }
grc() { gr --continue ; }
gri() { gr --interactive ; }
grt() { git rev-parse --show-toplevel ; }
gst() { git status ; }
gun() { git reset --soft HEAD~ ; }

gss() {
    local gitdir
    gitdir=$(git rev-parse --git-dir 2>/dev/null)
    [ "$?" -ne 0 ] && return

    local gitstatus
    gitstatus=$(git status --porcelain --branch 2>/dev/null)
    if [ "$?" -ne 0 ]; then
        echo "$CErr[???]$CReset"
        return
    fi

    local branchstatus
    local staged=0
    local changed=0
    local untracked=0
    local conflicts=0
    while IFS='' read -r line || [ -n "$line" ]; do
        case "${line:0:2}" in
            \#\#) branchstatus="${line:3}" ;;
            \?\?) ((untracked++)) ;;
            U?) ((conflicts++)) ;;
            ?U) ((conflicts++)) ;;
            DD) ((conflicts++)) ;;
            AA) ((conflicts++)) ;;
            ?M) ((changed++)) ;;
            \ ?) ((changed++)) ;;
            *) ((staged++)) ;;
        esac
    done <<< "$gitstatus"

    local branch
    local remote
    local ahead=0
    local behind=0
    if grep -q 'No commits yet on .' 2>/dev/null <<< "$branchstatus"; then
        branch=$(cut -d " " -f 5 <<< "$branchstatus")
    elif grep -q 'Initial commit on .' 2>/dev/null <<< "$branchstatus"; then
        branch=$(cut -d " " -f 4 <<< "$branchstatus")
    elif grep -q 'no branch' 2>/dev/null <<< "$branchstatus"; then
        branch=$(git describe --tag --exact-match 2>/dev/null || git rev-parse --abbrev-ref HEAD 2>/dev/null)
    else
        local branchstatus_main=$(cut -d " " -f 1 <<< "$branchstatus")
        branch=$(awk -F '\\.\\.\\.' '{$0=$1}1' <<< "$branchstatus_main")
        remote=$(awk -F '\\.\\.\\.' '{$0=$2}1' <<< "$branchstatus_main")

        IFS="[,]" read -ra branchinfos <<< "$(sed -n -e 's/^[^ ]* //p' <<< "$branchstatus")"
        for branchinfo in "${branchinfos[@]}"; do
            grep -q '^ahead ' 2>/dev/null <<< "$branchinfo" && ahead=${branchinfo:6}
            grep -q '^ \?behind ' 2>/dev/null <<< "$branchinfo" && behind=${branchinfo:7}
        done
    fi

    local color=$CGood
    [ "$ahead" -ne "0" ] || [ "$staged" -ne "0" ] && color=$CInfo
    [ "$changed" -ne "0" ] || [ "$untracked" -ne "0" ] && color=$CWarn
    [ "$behind" -ne "0" ] || [ "$conflicts" -ne "0" ] && color=$CErr

    local info=$branch
    [ "$ahead" -ne "0" ] && info="$info+$ahead"
    [ ! -z "$remote" ] && info="$info ⇒ $remote"
    [ "$behind" -ne "0" ] && info="$info+${behind# }"
    
    local extra
    [ "$staged" -ne "0" ] && extra="$extra ${CInfo}✔ $staged$color"
    [ "$changed" -ne "0" ] && extra="$extra $CWarn!$changed$color"
    [ "$untracked" -ne "0" ] && extra="$extra $CWarn?$untracked$color"
    [ "$conflicts" -ne "0" ] && extra="$extra ${CErr}✖ $conflicts$color"

    echo ${color}\[$info${extra:+ |$extra}\]$CReset
}
