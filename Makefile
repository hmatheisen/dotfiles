sync: create-dirs nvim vis alacritty bash zsh tmux scripts

create-dirs:
	@echo Creating directories...
	[ -d ~/.config ] || mkdir ~/.config
	[ -d ~/.local ]  || mkdir ~/.local
	@echo Done!

vimrc:
	ln -s config/nvim/init.vim ~/.vimrc

nvim:
	ln -s config/nvim      ~/.config/nvim

vis:
	ln -s config/vis       ~/.config/vis

alacritty:
	ln -s config/alacritty ~/.config/alacritty

bash:
	ln -s bashrc           ~/.bashrc
	ln -s bash_aliases     ~/.bash_aliases

zsh:
	ln -s zshrc            ~/.zshrc

tmux:
	ln -s tmux.conf        ~/.tmux.conf

scripts:
	ln -s scripts          ~/.local/bin
	ln -s $(PWD)/config/nvim/init.vim ~/.vimrc

nvim:
	ln -s $(PWD)/config/nvim      ~/.config/nvim

vis:
	ln -s $(PWD)/config/vis       ~/.config/vis

alacritty:
	ln -s $(PWD)/config/alacritty ~/.config/alacritty

bash:
	ln -s $(PWD)/bashrc           ~/.bashrc
	ln -s $(PWD)/bash_aliases     ~/.bash_aliases

zsh:
	ln -s $(PWD)/zshrc            ~/.zshrc

tmux:
	ln -s $(PWD)/tmux.conf        ~/.tmux.conf

scripts:
	ln -s $(PWD)/scripts          ~/.local/bin

clean:
	@# nvim
	rm -rf ~/.config/nvim
	@# vis
	rm -rf ~/.config/vis
	@# alacritty
	rm -rf ~/.config/alacritty
	@# bash
	rm -f  ~/.bashrc
	rm -f  ~/.bash_aliases
	@# zsh
	rm -f  ~/.zshrc
	@# tmux
	rm -f  ~/.tmux.conf
	@# scripts
	rm -rf ~/.local/bin

.PHONY: create-dirs nvim vis alacritty bash zsh tmux scripts scripts clean
