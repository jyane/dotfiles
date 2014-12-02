" Basic settings {{{
set enc=utf-8
set fenc=utf-8
set fencs=utf-8
scriptencoding utf-8
set encoding=utf-8

set fileencodings=utf-8,sjis,shift-jis,euc-jp,utf-16,ascii,ucs-bom,cp932,iso-2022-jp

set backspace=indent,eol,start
set nobackup
set noswapfile

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
set nocompatible
set textwidth=0
set nowrap

set scrolloff=3

set lazyredraw
set ttyfast

nnoremap j gj
nnoremap k gk

nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap Q <Nop>

" Borrowed from https://github.com/jimon93/dotfiles/blob/master/.vimrc
let mapleader = ' '
noremap <Leader><Leader> :w<CR>

" search settings {{{
set hlsearch
set smartcase
set incsearch
set hlsearch
nmap <silent> <ESC><ESC> :nohlsearch<CR>
set wrapscan
" }}}
" }}}

" NeoBunde {{{
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle'))
endif

NeoBundleFetch 'Shougo/neobundle.vim'

" bundles {{{
NeoBundle 'othree/html5.vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'tpope/vim-haml'

" tools
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'osyo-manga/vim-anzu'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \ 'windows' : 'make -f make_mingw32.mak',
      \ 'cygwin' : 'make -f make_cygwin.mak',
      \ 'mac' : 'make -f make_mac.mak',
      \ 'unix' : 'make -f make_unix.mak',
      \ },
      \ }

" themes
NeoBundle 'tomasr/molokai'
" }}}

filetype plugin indent on
NeoBundleCheck
" }}}

" Unite {{{
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> <Leader>uy :<C-u>Unite history/yank<CR>
nnoremap <silent> <Leader>ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> <Leader>uu :<C-u>Unite buffer file_mru<CR>
" }}}

" lightline {{{
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [
      \       ['mode', 'paste'],
      \       ['readonly', 'filename', 'modified', 'anzu']
      \   ]
      \ },
      \ 'component' : {
      \   'readonly' : '%{&readonly?"⭤":""}',
      \ },
      \ 'component_function': {
      \   'anzu': 'anzu#search_status'
      \ },
      \ 'separator': { 'left': "\u2b80", 'right': "\u2b82" },
      \ 'subseparator': { 'left': "\u2b81", 'right': "\u2b83" }
      \ }
" }}}

" anzu {{{
nmap n nzz<Plug>(anzu-update-search-status)
nmap N Nzz<Plug>(anzu-update-search-status)
nmap * <Plug>(anzu-star)
nmap # <Plug>(anzu-sharp)
" }}}

" neocomplcache {{{
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
" }}}

" appearance {{{
colorscheme molokai
if &term =~ "xterm-256color" || "screen-256color"
  set t_Co=256
  set t_Sf=[3%dm
  set t_Sb=[4%dm
elseif &term =~ "xterm-color"
  set t_Co=8
  set t_Sf=[3%dm
  set t_Sb=[4%dm
endif

set background=dark
syntax on

set guifont=Ricty\ for\ Powerline:h14
set transparency=20
vs
" }}}

" indent settings {{{
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent
set smartindent
set nopaste

let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#333322 ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#222211 ctermbg=darkgray

if has("autocmd")
  filetype plugin on
  filetype indent on

  autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et
  autocmd FileType html       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
  autocmd FileType scss       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType sass       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType php        setlocal sw=2 sts=2 ts=2 et
endif
" }}}

" emmet {{{
let g:user_emmet_leader_key='<c-t>'
" }}}

" space remover {{{
autocmd BufWritePre * :%s/\s\+$//ge
" }}}

" vimfiler {{{
let g:vimfiler_as_default_explorer = 1
nnoremap <silent> <Leader>fe :<C-u>VimFilerBufferDir -quit<CR>
" }}}

" template {{{
autocmd BufNewFile *.cpp 0r $HOME/.vim/template/template.cpp
" }}}
