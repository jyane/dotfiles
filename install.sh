#!/bin/bash

if [ -x "$(command -v apt)" ]; then
  sudo apt install -y -q \
    zsh \
    zsh-syntax-highlighting \
    tmux \
    fzf \
    jq \
    bat \
    silversearcher-ag
fi

cd $(dirname $0)
files=$(ls -al | awk '{ print $9 }' | grep -v -E '(^.$|^..$|^README.md$|^.git$|^install.sh$|^.config$)')

for i in $files
do
  if [ -e "${HOME}/${i}" ]; then
    echo "Skipping: ${i} because file or directory already exists."
  else
    ln -s "$(pwd)/$i" "${HOME}/${i}"
  fi
done

if [ -d "${HOME}/.config/nvim" ]; then
  echo "Skipping neovim setup because there seems to be an existing setting."
else
  ln -s "$(pwd)/.config/nvim" "${HOME}/.config/nvim"
  bash "${HOME}/.config/nvim/install.sh"
fi

if [ -d "${HOME}/.config/xkeysnail" ]; then
  echo "Skipping xkeysnail because file or directory already exists."
else
  ln -s "$(pwd)/.config/xkeysnail" "${HOME}/.config/xkeysnail"
fi
