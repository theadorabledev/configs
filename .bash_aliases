#Misc

alias "weka"="~/Downloads/weka-3-9-6/weka-3-9-6/weka.sh"

alias "fucking"="sudo"

alias "matrix"="cmatrix"

alias "fixtime"="ntpdate 129.6.15.28"

alias "erect"="vagrant up"

alias "boot-wifi"="sudo service networking restart; sudo service NetworkManager restart"

# Python stuff

alias "simp"="python -m SimpleHTTPServer"

alias "py2"="python2"

alias "py3"="python3"

alias "pym2"="python2 -m "

alias "pym3"="python3 -m "

alias "pym"="python -m "

# Searching for text in files

alias "ft"="grep -iRn"
fti(){
	grep -ir $1 --include=$2
}
alias "ftc"="grep -iRn -C 3"


# Updating this config file

alias "ua"="source ~/.bash_aliases"
alias "na"="emacs ~/.bash_aliases; ua"

# Navigation and directory structure

alias "ldirs"="ll | grep '^d'"
alias ".."="cd .."
alias "..."="cd ../.."
alias "...."="cd ../../.."

rm-word-from-files () {
    # Removes word from each file in the firectory if it appears
    for filename in ./*; do mv "./$filename" "./$(echo "$filename" | sed -e 's/$1//g')";  done
}

extract() {
    # Extracts data from various compression schemes
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

# Editing documents

alias "emacs"="emacs -nw"

alias "notes"="emacs ~/Documents/notes.org"

# Reading documents

vl () { sed -n ''$1','$2'p' $3; } #Read lines $1 to $2 in file $3

alias "readdoc"="docx2txt <"

alias "pprint"="python3 -m json.tool"

function csvprint() {
    column -t -s $1 -n "$2" | less -F -S -X -K
}

alias "c"="cat -n"

alias "img"="display"

alias "map"="grep -iRn function" # Fast way to see all functions in a file

alias "tl"="tail -f *"

## Speedreading

alias "speedread"="~/Documents/speedread/speedread"
speedreadpdf() {
     # Runs a speedreading program on the pdf you input
     speed=${2:-500};
     echo "$1";
     echo "$speed"
     pdftotext "$1" - | speedread -w "$speed";
}


#Git

##General shortenings

alias "ga"="git add"

alias "gap"="git add -p"

alias "gpo"="git pull origin"

alias "gcm"="git commit -m"

alias "gmm"="git merge master"

alias "gl"="git log --graph --decorate --oneline"

alias "push-branch"="git push -u origin HEAD"

alias "ogle"="git checkout"

time-warp() {
	    GIT_COMMITTER_DATE="${1:-$(date)}" git commit --amend --no-edit --date "${1:-$(date)}"
}

beg() { git pull origin "${1:-master}";}

new-branch(){
	git checkout master;
	git pull origin master;
	git checkout -b "$@";
}

alias "branches"="git branch -vv"

alias "undo-last-commit"="git reset HEAD^"

## Diff tracking

alias "gd"="git diff --cached"

alias "git-word"="git diff --word-diff=color"

alias "gd-word"="git diff --cached --word-diff=color"

alias "gdg"="git diff --color-words"

git-commit-diff(){
    # Shows how the files affected b one commit have changed    
    git diff-tree --name-only --no-commit-id -r $1 | xargs git diff $1 --
}


## gitk aliases with autocomplete
_authors() {
    # Helper function that returns possible contributor names and emails
    COMPREPLY=( $(compgen -W "$(git log --pretty="%an%n%ae" | sort | uniqe)" -- "${COMP_WORDS[1]}") )
}

alias "git-god"="gitk --all --date-order" 

git_fool() { git-god --author="${1:-Theadora}" ;} #returns everything I have done unless passed another name
alias git-fool=git_fool
complete -F _authors git-fool #autocompletes with contributer names

alias "what-have-i-done"="git-fool --since='24 hours ago' --no-merges" #Returns last 24 of your commits
alias "dear-god"="what-have-i-done" # A sense of humour?

alias "acv"="source env/bin/activate"

# Merges pdfs specified in first arg into second arg. Adds table of contents
_merge_pdfs() {
    tp="/tmp/tmp.pdf"
    td="/tmp/data"
    for i in ${@:1:-1}; do
	echo "Bookmarking $i"
	printf "BookmarkBegin\nBookmarkTitle: %s\nBookmarkLevel: 1\nBookmarkPageNumber: 1\n" "${i%.*}"> "$td"
	pdftk "$i" update_info "$td" output "$tp"
	mv "$tp" "$i"
    done
    echo "to ${@: -1}"
    pdftk ${@:1:-1} cat output "${@: -1}"
}
alias merge-pdfs=_merge_pdfs
