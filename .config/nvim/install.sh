BASE="${HOME}/.config/nvim"

cd "${BASE}"

mkdir -p "${BASE}/start"
cd "${BASE}/start"

git clone https://github.com/scrooloose/nerdcommenter
git clone https://github.com/google/vim-searchindex.git

mkdir -p "${BASE}/opt"
cd "${BASE}/opt"
