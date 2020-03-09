all: sync

sync:

  # Install vim-plug for neovim
  [[ -f  ~/.local/share/nvim/site/autoload/plug.vim ]] || \
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  # Install vim-plug for vim
  [[ -f  ~/.vim/autoload/plug.vim ]] || \
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  # .config
  [[ -d ~/.config/ranger ]] || ln -s $(PWD)/.config/ranger ~/.config/ranger
  [[ -d ~/.config/nvim ]] || ln -s $(PWD)/.config/nvim ~/.config/nvim

  # dot files
  [[ -f ~/.bashrc ]] || ln -s $(PWD)/.bashrc ~/.bashrc
  [[ -f ~/.tmux.conf ]] || ln -s $(PWD)/.tmux.conf ~/.tmux.conf
  
	# scripts
  [[ -d ~/.local/bin ]] || ln -s $(PWD)/bin ~/.local/bin

clean:

  rm -f ~/.bashrc
  rm -f ~/.tmux.conf
  rm -rf ~/.config/ranger
  rm -rf ~/.config/nvim
  rm -rf ~/.local/bin

.PHONY: all clean sync
