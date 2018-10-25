@ECHO OFF

:: Color Codes
:: [TODO - ANSICON]

:: Prompt
FOR /F %%A IN ('hostname') DO SET HOSTNAME=%%A

SET ISADMIN=NO
SET PROMPTCHAR=$$
NET SESSION >nul 2>&1
IF %errorLevel% == 0 (
    SET ISADMIN=YES
    SET PROMPTCHAR=#
)

:: [TODO - Git]
PROMPT $_cmd$S%USERNAME%@%HOSTNAME%$S$P$_%PROMPTCHAR%$S


:: Navigation
DOSKEY ls=echo ls -F -A %%* 1^>^&2 ^& ls -F -A $*
DOSKEY cdb=echo cd ^^^"^^%%BENCH^^%%^^^" 1^>^&2 ^& cd ^"%%BENCH%%^"
DOSKEY ..=echo cd .. ^& cd ..
DOSKEY ...=echo cd ../.. ^& cd ../..
DOSKEY ....=echo cd ../../.. ^& cd ../../..
DOSKEY .....=echo cd ../../../.. ^& cd ../../../..
DOSKEY ......=echo cd ../../../../.. ^& cd ../../../../..
DOSKEY .......=echo cd ../../../../../.. ^& cd ../../../../../..
DOSKEY ........=echo cd ../../../../../../.. ^& cd ../../../../../../..


:: Utility
:: [TODO - withtimeout]

DOSKEY npm-unlink=echo npm rm --global 1^>^&2 ^& npm rm --global
DOSKEY find-symlinks=echo find -L . -xtype l -ls 1^>^&2 ^& find -L . -xtype l -ls
DOSKEY reload=echo refreshenv ^^^& call ^^^"^^%%BENCH^^%%\autoexec.bat^^^" 1^>^&2 ^& refreshenv ^& call ^"%%BENCH%%\autoexec.bat^"

:: Git

DOSKEY gam=git commit --amend --no-edit $* ^& git status
DOSKEY gas=git add --no-ignore-removal $* ^& git status
DOSKEY chk=echo awk "/^[ \t]*[^ \t*]+[ \t]+[^ \t]+[ \t]+\[gone\]/ {print $^1}"
DOSKEY gbg=git branch -v ^| awk "/^[ \t]*[^ \t*]+[ \t]+[^ \t]+[ \t]+\[gone\]/ {print $"1}
DOSKEY gbp=git branch -v ^| awk "/^[ \t]*[^ \t*]+[ \t]+[^ \t]+[ \t]+\[gone\]/ {print $"1} ^| xargs git branch -d
DOSKEY  gd=git diff --break-rewrites --color $*
DOSKEY gds=git diff --break-rewrites --color --staged $*
DOSKEY gdx=git diff --break-rewrites --color --name-only --diff-filter=U $*
DOSKEY  gf=git fetch --all --prune --tags $* ^& git status
DOSKEY gff=git merge --ff-only $* ^& git status
DOSKEY  gl=git log --all --graph --decorate --date=relative $*
DOSKEY gla=git log --all --graph --decorate --date=relative --author-date-order $*
DOSKEY glo=git fsck --connectivity-only ^| grep '^^dangling commit' ^| cut -d ' ' -f 3 ^| xargs -n1 git log -1 --date=relative
DOSKEY  gr=git rebase $* ^& git status
DOSKEY gra=git rebase --abort
DOSKEY grc=git rebase --continue
DOSKEY gri=git rebase --interactive $*
DOSKEY grt=git rev-parse --show-toplevel
DOSKEY gst=git status $*
DOSKEY gun=printf "To redo this commit, run: git reset --soft " ^& git rev-parse HEAD ^& git reset --soft HEAD~

DOSKEY gss=bash -c '. ~/.bashrc ; gss'
