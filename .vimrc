set enc=utf-8
set fenc=utf-8
set fencs=utf-8
set encoding=utf-8

set fileencodings=utf-8,sjis,shift-jis,euc-jp,utf-16,ascii,ucs-bom,cp932,iso-2022-jp

set backspace=indent,eol,start
set nobackup

set number
set cursorline
set showmatch
set hidden
set ruler
set foldmethod=marker
set showcmd
" set list

" set nocompatible
filetype plugin indent off

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
	call neobundle#rc(expand('~/.vim/bundle'))
endif

NeoBundleFetch 'Shougo/neobundle.vim'

filetype plugin indent on


" tab settings {{{
set expandtab 
set tabstop=2
set autoindent
set smartindent
" }}}

" Unite {{{
NeoBundle 'Shougo/unite.vim'
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>
" }}}

" Lightline {{{
NeoBundle 'itchyny/lightline.vim'
set t_Co=256
set term=xterm-256color
let g:lightline = {
    \ 'colorscheme': 'jellybeans',
    \ 'active': {
    \   'left': [
    \       ['mode', 'paste'],
    \       ['readonly', 'filename', 'modified', 'anzu']
    \   ]
    \ },
    \ 'component_function': {
    \   'anzu': 'anzu#search_status'
    \ }
    \ }
" }}}

" anzu {{{
NeoBundle 'osyo-manga/vim-anzu'
nmap n <Plug>(anzu-n)
nmap N <Plug>(anzu-N)
nmap * <Plug>(anzu-star)
nmap # <Plug>(anzu-sharp)
" }}}

" theme {{{
NeoBundle 'tomasr/molokai'
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

syntax enable
hi PmenuSel cterm=reverse ctermfg=33 ctermbg=222 gui=reverse guifg=#3399ff guibg=#f0e68c

set guifont=Ricty:h14
set transparency=20
" }}}

