sync: create-dirs nvim vis ranger bash zsh tmux scripts

create-dirs:

	@echo Creating directories...
	[ -d ~/.config ]      || mkdir ~/.config
	[ -d ~/.local ]       || mkdir ~/.local
	@echo Done!

nvim:
	ln -s $(PWD)/config/nvim           ~/.config/nvim

vis:
	ln -s $(PWD)/config/vis           ~/.config/vis

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

clean:
	@# nvim
	rm -rf ~/.config/nvim
	@# vis
	rm -rf ~/.config/vis
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

.PHONY: create-dirs nvim vis ranger bash zsh tmux scripts scripts clean

