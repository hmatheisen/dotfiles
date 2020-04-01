# Test whether the curl command exists
CURL := $(shell command -v curl 2> /dev/null)
DIRS =
	.config/ranger
	.config/nvim
	.config/nvim/ultisnips
	.config/kitty
	.local/bin
FILES =
	.gvimrc
	.bashrc
	.tmux.conf
	.config/kitty/kitty.conf

all: vim-plug sync

vim-plug:
ifndef CURL
	$(error "curl is not execitable, please install it.")
else
	# Install vim-plug for neovim
	@echo Installing VimPlug for Neovim...
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	@echo Done!

	# Install vim-plug for vim
	@echo Installing VimPlug for Vim...
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	@echo Done!
endif

sync:

	@echo Checking for existing directories...
	for dir in $(DIRS) ; do \
		# Create directories on system if they do not exists
		[ -d ~/$$dir ] || mkdir ~/$$dir ; \
	done
	@echo Done!

	@echo Begin sync...
	# Sync directories
	for dir in $(DIRS) ; do \
		ln -s $(PWD)/$$dir ~/$$dir ; \
	done
	# Sync files
	for f in $(FILES) ; do \
		ln -s $(PWD)/$$f ~/$$f ; \
	done
	@echo Done!

clean:

	@echo Removing files on system...
	for f in $(FILES) ; do \
		rm -f ~/$$f ; \
	done
	@echo Done!

	@echo Removing directorieson system...
	for dir in $(DIRS) ; do \
		rm -rf ~/$$dir ; \
	done
	@echo Done!

	@echo Removing files from VimPLug...
	rm -f   ~/.local/share/nvim/site/autoload/plug.vim
	rm -f   ~/.vim/autoload/plug.vim
	@echo Done!

.PHONY: all clean sync
