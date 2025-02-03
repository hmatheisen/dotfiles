sync: create-dirs alacritty nvim vis scripts aliases tmux zsh

create-dirs:
	@echo Creating directories...
	[ -d ~/.config ] || mkdir ~/.config
	[ -d ~/.local ]  || mkdir ~/.local
	@echo Done!

yabai:
	ln -s $(PWD)/config/yabai      ~/.config/yabai
skhd:
	ln -s $(PWD)/config/skhd       ~/.config/skhd
alacritty:
	ln -s $(PWD)/config/alacritty ~/.config/alacritty
nvim:
	ln -s $(PWD)/config/nvim      ~/.config/nvim
vis:
	ln -s $(PWD)/config/vis       ~/.config/vis
scripts:
	ln -s $(PWD)/scripts          ~/.local/bin
aliases:
	ln -s $(PWD)/bash_aliases     ~/.bash_aliases
tmux:
	ln -s $(PWD)/tmux.conf        ~/.tmux.conf
vimrc:
	ln -s $(PWD)/vimrc            ~/.vimrc
zsh:
	ln -s $(PWD)/zshrc            ~/.zshrc

clean:
	@# yabai
	rm -rf ~/.config/yabai
	@# skhd
	rm -rf ~/.config/skhd
	@# alacritty
	rm -rf ~/.config/alacritty
	@# nvim
	rm -rf ~/.config/nvim
	@# vis
	rm -rf ~/.config/vis
	@# scripts
	rm -rf ~/.local/bin
	@# aliases
	rm -f  ~/.bash_aliases
	@# tmux
	rm -f  ~/.tmux.conf
	@# zsh
	rm -f  ~/.zshrc
