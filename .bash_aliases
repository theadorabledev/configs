alias "stuyPipStall=pip install $1 --proxy=149.89.1.30:3128"
alias "cd=cd $@; ls -a"
alias "stuyGitSetup=git config --global http.proxy 149.89.1.30:3128"

saveAlias () {
	cd; 
	git add .bash_aliases; 
	git commit -m "$@"; 
	git push -u origin master
}

