
alias ls="ls --show-control-chars -F --color -A"
alias unlink="npm rm --global"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

gam() { git commit --amend --no-edit ; gst }
gas() { git add -A ; gst }
gd () { git diff -B --color $* | perl ~/bench/ext/git/contrib/diff-highlight/diff-highlight | less }
gdc() { gd --name-only --diff-filter=U $* }
gds() { gd --staged $* }
gf () { git fetch --all --prune --tags $* ; gst }
gff() { git merge --ff-only $* ; gst}
gl () { git log --all --graph --decorate --date=relative --format=format:"%C(bold cyan)%h%C(reset) %C(white)%s%C(cyan) - %an%n         %C(bold yellow)%d%C(reset) %C(green)%aD %C(bold)(%ar)%C(reset)" $* }
gla() { gl --author-date-order $* }
glo() { git reflog | cut -d ' ' -f 1 | xargs gl }
gr () { git rebase $* ; gst }
gra() { gr --abort }
grc() { gr --continue }
gri() { gr --interactive }
grt() { git rev-parse --show-toplevel }
gst() { git status }
gun() { git reset --soft HEAD~ }
