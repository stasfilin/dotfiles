install-vim:
	curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
	sh ./install.sh || echo "Install neobundle"
	rm -r install.sh
	cp vim/.vimrc ~/
