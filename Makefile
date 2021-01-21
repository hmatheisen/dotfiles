sync: create-dirs vim-plug nvim ranger bash zsh tmux scripts scripts awesome

create-dirs:

	@echo Creating directories...
	[ -d ~/.config ]      || mkdir ~/.config
	[ -d ~/.local ]       || mkdir ~/.local
	[ -d ~/.config/coc ]  || mkdir ~/.config/coc
	@echo Done!

vim-plug:
	@echo Installing VimPlug for Neovim...
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	@echo Done!

vimrc:
	grep -vE "^source" config/nvim/init.vim > vimrc

nvim:
	ln -s $(PWD)/config/nvim           ~/.config/nvim
	ln -s $(PWD)/config/nvim/ultisnips ~/.config/coc/ultisnips
	ln -s $(PWD)/vimrc                 ~/.vimrc

ranger:
	ln -s $(PWD)/config/ranger         ~/.config/ranger

bash:
	ln -s $(PWD)/bashrc                ~/.bashrc
	ln -s $(PWD)/bash_aliases          ~/.bash_aliases

zsh:
	ln -s $(PWD)/zshrc                 ~/.zshrc

tmux:
	ln -s $(PWD)/tmux.conf             ~/.tmux.conf

scripts:
	ln -s $(PWD)/scripts               ~/.local/bin

awesome:
	ln -s $(PWD)/config/awesome         ~/.config/awesome

clean:
	@# nvim
	rm -rf ~/.config/nvim
	rm -rf ~/.config/coc/ultisnips
	rm -f  ~/.vimrc
	@# ranger
	rm -rf ~/.config/ranger
	@# bash
	rm -f  ~/.bashrc
	rm -f  ~/.bash_aliases
	@# zsh
	rm -f  ~/.zshrc
	@# tmux
	rm -f  ~/.tmux.conf
	@# scripts
	rm -rf ~/.local/bin
	@# awesome
	rm -rf ~/.config/awesome

.PHONY: create-dirs vim-plug nvim ranger bash zsh tmux scripts scripts clean

