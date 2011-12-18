install:
	mkdir ~/.vim/bundle
	git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
	ln -sf ~+/vimrc ~/.vimrc
	vim -c ":BundleInstall"
