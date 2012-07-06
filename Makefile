install:
	mkdir ~/.vim/bundle
	git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
	ln -sf ~/.vim/vimrc ~/.vimrc
	vim -c ":BundleInstall"
