"Basic settings {{{
scriptencoding utf-8

set enc=utf-8
set fenc=utf-8
set fencs=utf-8
set encoding=utf-8

set fileencodings=utf-8,sjis,shift-jis,euc-jp,utf-16,ascii,ucs-bom,cp932,iso-2022-jp
set backspace=indent,eol,start
set noswapfile
set mouse-=a

" kaoriya
set noundofile

set number
set cursorline
set autoread
set vb t_vb=
set whichwrap=b,s,h,l,<,>,[,]
set showmatch
set hidden
set ruler
set foldmethod=marker
set showcmd
set showmode
set textwidth=0
set nowrap
set laststatus=2

set scrolloff=3

set lazyredraw
set ttyfast

set ambiwidth=double

set clipboard+=unnamedplus

nnoremap j gj
nnoremap k gk

nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap Q <Nop>

inoremap { {}<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>

set backup
set backupdir=~/workspace/tmp/nvim

set completeopt-=preview

" Borrowed from https://github.com/jimon93/dotfiles/blob/master/.vimrc
" let g:mapleader = ' '
" noremap <Leader><Leader> :w<CR>

" search settings {{{
set hlsearch
set ignorecase
set smartcase
set incsearch
nmap <silent> <ESC><ESC> :nohlsearch<CR>
set wrapscan
" }}}
" }}}

" dein {{{
filetype plugin indent off

if &compatible
  set nocompatible
endif

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let s:toml      = '~/.config/dein/.dein.toml'
  let s:lazy_toml = '~/.config/dein/.dein_lazy.toml'

  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
" }}}

" color scheme {{{
set background=dark
colorscheme atom-dark-256
syntax on
" }}}

" Unite {{{
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 400
nnoremap <silent> <Leader>uy :<C-u>Unite history/yank<CR>
nnoremap <silent> <Leader>ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> <Leader>uu :<C-u>Unite buffer file_mru<CR>
" }}}

" lightline {{{
let g:lightline = {
  \ 'active': {
  \   'left': [
  \       ['mode', 'paste'],
  \       ['readonly', 'filename', 'modified', 'anzu']
  \   ]
  \ },
  \ 'component_function': {
  \ 'anzu': 'anzu#search_status'
  \ }
  \ }
" }}}

" anzu {{{
nmap n nzz<Plug>(anzu-update-search-status)
nmap N Nzz<Plug>(anzu-update-search-status)
nmap * <Plug>(anzu-star)
nmap # <Plug>(anzu-sharp)
" }}}


" incsearch {{{
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
" }}}

" indent settings {{{
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent
set smartindent
set nopaste

let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size =1
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#333322 ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#222211 ctermbg=233
autocmd FileType * set formatoptions-=ro
autocmd InsertLeave * set nopaste
" }}}

au BufRead,BufNewFile *.md set filetype=markdown

" nerdcommenter {{{
let NERDSpaceDelims = 1
nmap ; <Plug>NERDCommenterToggle
vmap ; <Plug>NERDCommenterToggle
" }}}

" vimfiler {{{
let g:vimfiler_as_default_explorer = 1
nnoremap <silent> <space>fe :<C-u>VimFilerBufferDir -quit<CR>

function! UniteFileCurrentDir()
  let s  = ':Unite file -start-insert -path='
  let s .= vimfiler#get_current_vimfiler().current_dir

  execute s
endfunction

autocmd FileType vimfiler
      \ nnoremap <buffer><silent>/
      \ :call UniteFileCurrentDir() <CR>
" }}}

" deocomplete {{{
let g:deoplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
call deoplete#custom#source('_', 'converters', ['converter_auto_paren'])
call deoplete#custom#option({
      \ 'smart_case': v:true,
      \ })
" " }}}

augroup vimrc-checktime
  autocmd!
  autocmd InsertEnter,WinEnter * checktime
augroup END

function! StrTrim(txt)
  return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endfunction

" {{{ LSP
lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "gopls", "clangd" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end

nvim_lsp.gopls.setup {
  on_attach = on_attach,
  settings = {
    gopls = {
      -- env = {
        -- GOPACKAGESDRIVER = './tools/gopackagesdriver.sh'
      -- },
      directoryFilters = {
        "-bazel-bin",
        "-bazel-out",
        "-bazel-testlogs",
        "-bazel-j2",
      },
      usePlaceholders = true,
    },
  },
}
function OrgImports(wait_ms)
  local params = vim.lsp.util.make_range_params()
  params.context = {only = {"source.organizeImports"}}
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
  for _, res in pairs(result or {}) do
    for _, r in pairs(res.result or {}) do
      if r.edit then
        vim.lsp.util.apply_workspace_edit(r.edit, "UTF-8")
      else
        vim.lsp.buf.execute_command(r.command)
      end
    end
  end
end

EOF

autocmd BufWritePre *.go lua OrgImports(1000)
autocmd BufWritePre *.go lua vim.lsp.buf.formatting()
" }}}
