install:
	mkdir -p ~/.vim/bundle
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	ln -sf ~/.vim/vimrc ~/.vimrc
	vim +PluginInstall +qall
