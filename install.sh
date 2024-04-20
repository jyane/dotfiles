#!/bin/bash

cd $(dirname $0)
files=$(ls -al | awk '{ print $9 }' | grep -v -E '(^.$|^..$|^README.md$|^.git$|^install.sh$|^.config$)')

for i in $files
do
  ln -s "$(pwd)/$i" "${HOME}/${i}"
done

ln -s "$(pwd)/.config/nvim/init.vim" "${HOME}/.config/nvim/init.vim"
