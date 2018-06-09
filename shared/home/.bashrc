
alias ls="ls -F -A"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias npm-unlink="npm rm --global"

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
