#!/bin/bash

set -ue -o pipefail

BASE="${HOME}/.config/nvim"

START_LIBS=(
"scrooloose/nerdcommenter"
"google/vim-searchindex"
"catppuccin/nvim"
"preservim/nerdtree"
"hrsh7th/nvim-cmp"
"hrsh7th/cmp-nvim-lsp"
"neovim/nvim-lspconfig"
"nvim-lualine/lualine.nvim"
"junegunn/fzf"
"junegunn/fzf.vim"
"nvim-tree/nvim-tree.lua"
"nvim-tree/nvim-web-devicons"
)

OPT_LIBS=(
)

_clone_repos() {
  for v in "$@"
  do
    git clone --depth=1 "https://github.com/${v}.git"
  done
}

_setup() {
  # create a backup dir
  mkdir -p "${HOME}"/workspace/tmp/nvim

  mkdir -p "${BASE}/start"
  cd "${BASE}/start"
  _clone_repos ${START_LIBS[@]}

  mkdir -p "${BASE}/opt"
  cd "${BASE}/opt"
  _clone_repos ${OPT_LIBS[@]}
}

_update() {
  for v in "${START_LIBS[@]}"
  do
    local dir=(${v//\// })
    git -C "${BASE}/start/${dir[1]}" pull
  done
  for v in "${OPT_LIBS[@]}"
  do
    local dir=(${v//\// })
    git -C "${BASE}/opt/${dir[1]}" pull
  done
}

main() {
  local command=$1

  if type "_${command}" >/dev/null 2>/dev/null; then
    "_${command}" "${@}"
  else
    echo "No such command: ${command}"
  fi
}

main "$@"
