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
fi

if [ -d "${HOME}/.config/xkeysnail" ]; then
  echo "Skipping xkeysnail because file or directory already exists."
else
  ln -s "$(pwd)/.config/xkeysnail" "${HOME}/.config/xkeysnail"
fi

jpkg --mode=install --jpkg-manifest-file=".zsh/jpkg-manifest.txtpb" --jpkg-lock-file=".zsh/jpkg-lock.txtpb" --base-dir=".zsh/plugins/"
jpkg --mode=install --jpkg-manifest-file=".tmux/jpkg-manifest.txtpb" --jpkg-lock-file=".tmux/jpkg-lock.txtpb" --base-dir=".tmux/plugins/"
jpkg --mode=install --jpkg-manifest-file=".config/nvim/jpkg-manifest.txtpb" --jpkg-lock-file=".config/nvim/jpkg-lock.txtpb" --base-dir=".config/nvim/start/"
