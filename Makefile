all: sync

sync:

	# Install vim-plug for neovim
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

	# Install vim-plug for vim
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

	# .config
	ln -s $(PWD)/.config/ranger ~/.config/ranger
	ln -s $(PWD)/.config/nvim ~/.config/nvim
	ln -s $(PWD)/.config/nvim/ultisnips ~/.config/coc/ultisnips

	# dot files
	ln -s $(PWD)/.bashrc ~/.bashrc
	ln -s $(PWD)/.tmux.conf ~/.tmux.conf

	# scripts
	ln -s $(PWD)/bin ~/.local/bin

clean:

	rm -f ~/.bashrc
	rm -f ~/.local/share/nvim/site/autoload/plug.vim
	rm -f ~/.vim/autoload/plug.vim
	rm -f ~/.tmux.conf
	rm -rf ~/.config/ranger
	rm -rf ~/.config/nvim
	rm -rf ~/.local/bin
	rm -rf ~/.config/coc/ultisnips

.PHONY: all clean sync
