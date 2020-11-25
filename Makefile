sync: create-dirs vim-plug nvim ranger alacritty bash tmux scripts X11 scripts spectrwm

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

nvim:
	ln -s $(PWD)/config/nvim           ~/.config/nvim
	ln -s $(PWD)/config/nvim/ultisnips ~/.config/coc/ultisnips

ranger:
	ln -s $(PWD)/config/ranger         ~/.config/ranger

alacritty:
	ln -s $(PWD)/config/alacritty      ~/.config/alacritty

bash:
	ln -s $(PWD)/bashrc                ~/.bashrc
	ln -s $(PWD)/bash_aliases          ~/.bash_aliases

tmux:
	ln -s $(PWD)/tmux.conf             ~/.tmux.conf

scripts:
	ln -s $(PWD)/scripts               ~/.local/bin

X11:
	ln -s $(PWD)/Xmodmap               ~/.Xmodmap
	ln -s $(PWD)/Xresources            ~/.Xresources
	ln -s $(PWD)/Xprofile              ~/.Xprofile

spectrwm:
	ln -s $(PWD)/spectrwm.conf         ~/.spectrwm.conf

clean:
	@# nvim
	rm -rf ~/.config/nvim
	rm -rf ~/.config/coc/ultisnips
	@# ranger
	rm -rf ~/.config/ranger
	@#alacritty
	rm -rf ~/.config/alacritty
	@# bash
	rm -f  ~/.bashrc
	rm -f  ~/.bash_aliases
	@# tmux
	rm -f  ~/.tmux.conf
	@# scripts
	rm -rf ~/.local/bin
	@# X11
	rm -f  ~/.Xmodmap
	rm -f  ~/.Xresources
	rm -f  ~/.Xprofile
	@# spectrwm
	rm -f  ~/.spectrwm.conf

.PHONY: sync create-dirs vim-plug nvim ranger alacritty bash tmux scripts X11 scripts spectrwm
