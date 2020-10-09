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
	[ -d ~/.config/kitty ]  || mkdir ~/.config/kitty
	[ -d ~/.config/coc ]    || mkdir ~/.config/coc
	[ -d ~/.config/ranger ] || mkdir ~/.config/ranger
	@echo Done!

	@echo Sync config folder...
	ln -s $(PWD)/.config/ranger/rc.conf   ~/.config/ranger/rc.conf
	ln -s $(PWD)/.config/nvim             ~/.config/nvim
	ln -s $(PWD)/.config/nvim/ultisnips   ~/.config/coc/ultisnips
	ln -s $(PWD)/.config/kitty/kitty.conf ~/.config/kitty/kitty.conf
	@echo Done!

	@echo Sync files...
	ln -s $(PWD)/.bashrc               ~/.bashrc
	ln -s $(PWD)/.tmux.conf            ~/.tmux.conf
	ln -s $(PWD)/.config/nvim/init.vim ~/.vimrc
	@echo Done!

	@echo Sync script folder
	ln -s $(PWD)/bin ~/.local/bin
	@echo Done!

clean:

	rm -f  ~/.bashrc
	rm -f  ~/.local/share/nvim/site/autoload/plug.vim
	rm -f  ~/.vim/autoload/plug.vim
	rm -f  ~/.tmux.conf
	rm -rf ~/.config/ranger
	rm -rf ~/.config/nvim
	rm -rf ~/.config/coc/ultisnips
	rm -rf ~/.local/bin

.PHONY: all clean sync
