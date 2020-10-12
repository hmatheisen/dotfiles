CURL := $(shell command -v curl 2> /dev/null)

all: vim-plug sync

vim-plug:

ifndef CURL
	$(error "curl is not execitable, please install it.")
else
	@echo Installing VimPlug for Neovim...
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	@echo Done!
endif

sync:

	@echo Creating directories...
	[ -d ~/.config ]        || mkdir ~/.config
	[ -d ~/.local ]         || mkdir ~/.local
	[ -d ~/.config/coc ]    || mkdir ~/.config/coc
	[ -d ~/.config/ranger ] || mkdir ~/.config/ranger
	@echo Done!

	@echo Sync config folder...
	ln -s $(PWD)/.config/ranger/rc.conf   ~/.config/ranger/rc.conf
	ln -s $(PWD)/.config/nvim             ~/.config/nvim
	ln -s $(PWD)/.config/nvim/ultisnips   ~/.config/coc/ultisnips
	@echo Done!

	@echo Sync files...
	ln -s $(PWD)/.bashrc               ~/.bashrc
	ln -s $(PWD)/.bash_aliases         ~/.bash_aliases
	ln -s $(PWD)/.tmux.conf            ~/.tmux.conf
	ln -s $(PWD)/mini.vim              ~/.vimrc
	@echo Done!

	@echo Sync script folder
	ln -s $(PWD)/bin ~/.local/bin
	@echo Done!

clean:

	rm -f  ~/.bashrc
	rm -f  ~/.local/share/nvim/site/autoload/plug.vim
	rm -f  ~/.tmux.conf
	rm -f  ~/.vimrc
	rm -f  ~/.bash_aliases
	rm -rf ~/.config/ranger
	rm -rf ~/.config/nvim
	rm -rf ~/.config/coc/ultisnips
	rm -rf ~/.local/bin

.PHONY: all clean sync
