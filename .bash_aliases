alias "ga"="git add -p"
alias "matrix"="cmatrix"
alias "push-branch"="git push -u origin HEAD"
new-branch(){
	git checkout master;
	git pull origin master;
	git checkout -b "$@";
}

vl () { sed -n ''$1','$2'p' $3; }
rm-word-from-files () {
	for filename in ./*; do mv "./$filename" "./$(echo "$filename" | sed -e 's/$1//g')";  done
}
alias "ft"="grep -iRn"
alias "ftc"="grep -iRn -C 3"
alias "branches"="git branch -vv"
alias "ua"="source ~/.bash_aliases"
alias "gd"="git diff --cached"
alias "gdg"="git diff --color-words"
alias "na"="emacs ~/.bash_aliases; ua"
alias "c"="cat -n"
alias "img"="display"
alias "map"="grep -iRn function"
alias "gl"="git log --graph --decorate --oneline"
alias "git-god"="gitk --all --date-order"
alias "git-fool"="git-god --author=Theadora"
alias "what-have-i-done"="git-fool --since='24 hours ago' --no-merges"
alias "dear-god"="what-have-i-done"
alias "ldirs"="ll | grep '^d'"
alias "gpo"="git pull origin"
alias "gcm"="git commit -m"
alias ".."="cd .."
alias "..."="cd ../.."
alias "...."="cd ../../.."
alias "fixtime"="ntpdate 129.6.15.28"
alias "undo-last-commit"="git reset HEAD^"
alias "tl"="tail -f *"
extract() {
if [ -z ${1} ] || [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    echo "Usage: extract <archive> [directory]"
    echo "Example: extract presentation.zip."
    echo "Valid archive types are:"
    echo "tar.bz2, tar.gz, tar.xz, tar, bz2, gz, tbz2,"
    echo "tbz, tgz, lzo, rar, zip, 7z, xz, txz, lzma and tlz"
else
    case "$1" in
        *.tar.bz2|*.tbz2|*.tbz)         tar xvjf "$1" ;;
        *.tgz)                          tar zxvf "$1" ;;
        *.tar.gz)                       tar xvzf "$1" ;;
        *.tar.xz)                       tar xvJf "$1" ;;
        *.tar)                          tar xvf "$1" ;;
        *.rar)                          7z x "$1" ;;
        *.zip)                          unzip "$1" ;;
        *.7z)                           7z x "$1" ;;
        *.lzo)                          lzop -d  "$1" ;;
        *.gz)                           gunzip "$1" ;;
        *.bz2)                          bunzip2 "$1" ;;
        *.Z)                            uncompress "$1" ;;
        *.xz|*.txz|*.lzma|*.tlz)        xz -d "$1" ;;
        *) echo "Sorry, '$1' could not be decompressed." ;;
    esac
fi
}

alias "emacs"="emacs -nw"

git-commit-diff(){
	#Shows how the files affected b one commit have changed
	git diff-tree --name-only --no-commit-id -r $1 | xargs git diff $1 --

}

alias "simp"="python -m SimpleHTTPServer"