local options = {
  enc = 'utf-8',
  fenc = 'utf-8',
  fencs = 'utf-8',
  encoding = 'utf-8',
  fileencodings = 'utf-8,sjis,shift-jis,euc-jp,utf-16,ascii,ucs-bom,cp932,iso-2022-jp',
  backspace = 'indent,eol,start',
  swapfile = false,
  mouse= 'a',
  undofile = false,
  number = true,
  cursorline = true,
  autoread = true,
  belloff = 'all',
  whichwrap='b,s,h,l,<,>,[,]',
  showmatch = ture,
  hidden = true,
  ruler = true,
  foldmethod = 'marker',
  showcmd = true,
  showmode = true,
  textwidth = 0,
  wrap = false,
  scrolloff = 3,
  lazyredraw = true,
  ttyfast = true,
  ambiwidth= 'double',
  clipboard= 'unnamedplus',
  backup = true,
  backupdir = vim.fn.expand('$HOME/workspace/tmp/nvim'),
  hlsearch = true,
  ignorecase = true,
  smartcase = true,
  incsearch = true,
  wrapscan = true,
  expandtab = true,
  tabstop = 2,
  shiftwidth = 2,
  softtabstop = 2,
  autoindent = true,
  smartindent = true,
  paste = false,
  laststatus = 3,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end