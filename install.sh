#!/bin/bash

if [ -x "$(command -v apt)" ]; then
  sudo apt install -y -q \
    zsh \
    tmux \
    fzf \
    jq \
    bat \
    ripgrep
fi

files=$(ls -al | awk '{ print $9 }' | grep -v -E '(^.$|^..$|^README.md$|^.git$|^install.sh$|^.config$)')

echo $files

for i in $files
do
  if [ -e "${HOME}/${i}" ]; then
    echo "Skipping: ${i} because file or directory already exists."
  else
    ln -s "$(pwd)/$i" "${HOME}/${i}"
  fi
done

if [ -d "${HOME}/.config/nvim" ]; then
  echo "Skipping neovim setup because there seems to be an existing setting?"
else
  ln -s "$(pwd)/.config/nvim" "${HOME}/.config/nvim"
  cd .config/nvim
  jpkg --mode=install
  cd -
fi

if [ -d "${HOME}/.config/xremap" ]; then
  echo "Skipping xremap because file or directory already exists."
else
  ln -s "$(pwd)/.config/xremap" "${HOME}/.config/xremap"
fi

cd .zsh
jpkg --mode=install
cd -

cd .tmux
jpkg --mode=install
cd -

echo 'Done'
