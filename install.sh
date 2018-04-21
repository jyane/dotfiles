#!/bin/bash

cd $(dirname $0)
files=$(ls -al | awk '{ print $9 }' | grep -v -E '(^.$|^..$|^README.md$|^.git$|^install.sh$|^.config$)')

for i in $files
do
  ln -s "$(pwd)/$i" "${HOME}/${i}"
done

ln -s "$(pwd)/.config/nvim/init.vim" "${HOME}/.config/nvim/init.vim"
ln -s "$(pwd)/.config/dein/.dein.toml" "${HOME}/.config/dein/.dein.toml"
ln -s "$(pwd)/.config/dein/.dein_lazy.toml" "${HOME}/.config/dein/.dein_lazy.toml"
