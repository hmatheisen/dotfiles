#!/bin/sh

echo "\n\n"
echo "========================================="
echo "=======    Installing dotfiles    ======="
echo "========================================="
echo "\n\n"

# On macos, if a newer bash is install, just copy the files
# else, change the path to the default shell
if [ -f /usr/local/bin/bash ]; then
  echo "/usr/local/bin/bash was found"
else
  echo "/usr/local/bin/bash was not found"
  # CHanging path in new files
  echo "Changing default shell"
  sed -i "s/\/usr\/local\/bin\/bash/\/bin\/bash/g" .tmux.conf
  sed -i "s/\/usr\/local\/bin\/bash/\/bin\/bash/g" .vimrc
fi

# Copy dotfiles to home
echo "Copying dotfiles to home"
cp .bashrc .gvimrc .tmux.conf .vimrc ~

# Copy .config into the home folder
echo "Copying the config folder to home"
cp -r .config/ ~/.config/

# Installing scripts
echo "Installing scripts"
for s in .scripts/*; do
  chmod +x $s
  cp $s /usr/bin/
done
