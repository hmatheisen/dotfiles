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

	@echo Installing VimPlug for Vim...
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	@echo Done!
endif

sync:

	@echo Creating directories...
	[ -d ~/.config ]       || mkdir ~/.config
	[ -d ~/.local ]        || mkdir ~/.local
	[ -d ~/.config/kitty ] || mkdir ~/.config/kitty
	@Done!

	@echo Sync config folder...
	ln -s $(PWD)/.config/ranger           ~/.config/ranger
	ln -s $(PWD)/.config/nvim             ~/.config/nvim
	ln -s $(PWD)/.config/nvim/ultisnips   ~/.config/coc/ultisnips
	ln -s $(PWD)/.config/kitty/kitty.conf ~/.config/kitty/kitty.conf
	@echo Done!

	@echo Sync files...
	ln -s $(PWD)/.gvimrc    ~/.gvimrc
	ln -s $(PWD)/.bashrc    ~/.bashrc
	ln -s $(PWD)/.tmux.conf ~/.tmux.conf
	@echo Done!

	@echo Sync script folder
	ln -s $(PWD)/bin ~/.local/bin
	@echo Done!

clean:

	rm -f   ~/.bashrc
	rm -f   ~/.local/share/nvim/site/autoload/plug.vim
	rm -f   ~/.vim/autoload/plug.vim
	rm -f   ~/.tmux.conf
	rm -f   ~/.gvimrc
	rm -f   ~/.config/kitty/kitty.conf
	rm -rf  ~/.config/ranger
	rm -rf  ~/.config/nvim
	rm -rf  ~/.local/bin
	rm -rf  ~/.config/coc/ultisnips

.PHONY: all clean sync
