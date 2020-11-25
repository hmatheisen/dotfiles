sync: create-dirs vim-plug nvim ranger alacritty bash tmux scripts X11 spectrwm

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
	ln -s config/nvim           ~/.config/nvim
	ln -s config/nvim/ultisnips ~/.config/coc/ultisnips

ranger:
	ln -s config/ranger         ~/.config/ranger

alacritty:
	ln -s config/alacritty      ~/.config/alacritty

bash:
	ln -s bashrc                ~/.bashrc
	ln -s bash_aliases          ~/.bash_aliases

tmux:
	ln -s tmux.conf             ~/.tmux.conf

scripts:
	ln -s scripts               ~/.local/bin

X11:
	ln -s Xmodmap               ~/.Xmodmap
	ln -s Xresources            ~/.Xresources
	ln -s Xprofile              ~/.Xprofile

spectrwm:
	ln -s spectrwm.conf         ~/.spectrwm.conf

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
