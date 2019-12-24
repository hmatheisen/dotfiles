all: sync

sync:
	mkdir -p ~/.config/alacritty

	# .config
	[[ -f ~/.config/alacritty/alacritty.yml ]] || ln -s $(PWD)/.config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
	[[ -d ~/.config/ranger ]] || ln -s $(PWD)/.config/ranger ~/.config/ranger
	[[ -d ~/.config/nvim ]] || ln -s $(PWD)/.config/nvim ~/.config/nvim

	# dot files
	[[ -f ~/.bashrc ]] || ln -s $(PWD)/.bashrc ~/.bashrc
	[[ -f ~/.tmux.conf ]] || ln -s $(PWD)/.tmux.conf ~/.tmux.conf

	# scripts
	[[ -d ~/.local/bin ]] || ln -s $(PWD)/bin ~/.local/bin

clean:
	rm -f ~/.config/alacritty/alacritty.yml
	rm -f ~/.bashrc
	rm -f ~/.tmux.conf
	rm -rf ~/.config/ranger
	rm -rf ~/.config/nvim
	rm -rf ~/.local/bin

.PHONY: all clean sync
