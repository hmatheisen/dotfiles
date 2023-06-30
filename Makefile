sync: create-dirs alacritty nvim vis scripts bash tmux vimrc zsh

create-dirs:
	@echo Creating directories...
	[ -d ~/.config ] || mkdir ~/.config
	[ -d ~/.local ]  || mkdir ~/.local
	@echo Done!

alacritty:
	ln -s $(PWD)/config/alacritty            ~/.config/alacritty
nvim:
	ln -s $(PWD)/config/nvim                 ~/.config/nvim
vis:
	ln -s $(PWD)/config/vis                  ~/.config/vis
scripts:
	ln -s $(PWD)/scripts                     ~/.local/bin
bash:
	ln -s $(PWD)/bashrc                      ~/.bashrc
	ln -s $(PWD)/bash_aliases                ~/.bash_aliases
tmux:
	ln -s $(PWD)/tmux.conf                   ~/.tmux.conf
vimrc:
	ln -s $(PWD)/vimrc                       ~/.vimrc
zsh:
	ln -s $(PWD)/zshrc                       ~/.zshrc

clean:
	@# alacritty
	rm -rf ~/.config/alacritty
	@# nvim
	rm -rf ~/.config/nvim
	@# vis
	rm -rf ~/.config/vis
	@# scripts
	rm -rf ~/.local/bin
	@# bash
	rm -f  ~/.bashrc
	rm -f  ~/.bash_aliases
	@# tmux
	rm -f  ~/.tmux.conf
	@# vimrc
	rm -f  ~/.vimrc
	@# zsh
	rm -f  ~/.zshrc

.PHONY: create-dirs alacritty nvim vis scripts bash tmux vimrc zsh clean
