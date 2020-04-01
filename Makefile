# Test whether the curl command exists
CURL := $(shell command -v curl 2> /dev/null)
CREATEDIRS = .config/ .local/ .config/kitty
SYNCDIRS = .config/ranger .config/nvim .config/nvim/ultisnips .local/bin
SYNCFILES = .gvimrc .bashrc .tmux.conf .config/kitty/kitty.conf

all: vim-plug sync

vim-plug:

ifndef CURL
	$(error "curl is not execitable, please install it.")
else
	@echo Installing VimPlug for Neovim...
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	@echo Done!

	@echo Installing VimPlug for Vim...
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	@echo Done!
endif

sync:

	@echo Creating folders...
	for dir in $(CREATEDIRS) ; do \
		[ -d ~/$$CREATEDIRS ] || mkdir ~/$$CREATEDIRS
	done
	@echo Done!

	@echo Begin sync...
	for dir in $(SYNCDIRS) ; do \
		ln -s $(PWD)/$$dir ~/$$dir ; \
	done
	for f in $(SYNCFILES) ; do \
		ln -s $(PWD)/$$f ~/$$f ; \
	done
	@echo Done!

clean:

	@echo Removing files on system...
	for f in $(SYNCFILES) ; do \
		rm -f ~/$$f ; \
	done
	@echo Done!

	@echo Removing directorieson system...
	for dir in $(SYNCDIRS) ; do \
		rm -rf ~/$$dir ; \
	done
	@echo Done!

	@echo Removing files from VimPLug...
	rm -f   ~/.local/share/nvim/site/autoload/plug.vim
	rm -f   ~/.vim/autoload/plug.vim
	@echo Done!

.PHONY: all clean sync
