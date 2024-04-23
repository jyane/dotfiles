clone() {
  local repo=$1
  git clone --depth=1 "https://github.com/${repo}.git"
}

# create a backup dir
mkdir -p "${HOME}"/workspace/tmp/nvim

BASE="${HOME}/.config/nvim"
cd "${BASE}"

mkdir -p "${BASE}/start"
cd "${BASE}/start"
clone scrooloose/nerdcommenter
clone google/vim-searchindex
clone vv9k/vim-github-dark
clone preservim/nerdtree
clone hrsh7th/nvim-cmp
clone hrsh7th/cmp-nvim-lsp
clone neovim/nvim-lspconfig
clone nvim-lualine/lualine.nvim

mkdir -p "${BASE}/opt"
cd "${BASE}/opt"
