
alias "stuyGitSetup=git config --global http.proxy 149.89.1.30:3128"
alias "rm=rm -I "

stuypip () {
	stuyPipStall=pip install $@ --proxy=149.89.1.30:3128
}

stuyget () {
	stuyget=wget $@ -e use_proxy=on  -e http_proxy=149.89.1.30:3128;
}

cd () {
	builtin cd $@;
	ls -a;
}

saveAlias () {
	cd; 
	git add .bash_aliases; 
	git commit -m "$@"; 
	git push -u origin master;
}

