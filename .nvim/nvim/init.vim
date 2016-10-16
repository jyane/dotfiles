" Basic settings {{{
scriptencoding utf-8

set enc=utf-8
set fenc=utf-8
set fencs=utf-8
set encoding=utf-8

set fileencodings=utf-8,sjis,shift-jis,euc-jp,utf-16,ascii,ucs-bom,cp932,iso-2022-jp
set backspace=indent,eol,start
set noswapfile

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

set backup
set backupdir=~/workspace/tmp/nvim

" Borrowed from https://github.com/jimon93/dotfiles/blob/master/.vimrc
let g:mapleader = ' '
noremap <Leader><Leader> :w<CR>

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

let s:dein_dir = expand('~/.config/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let s:toml      = s:dein_dir . '/.dein.toml'
  let s:lazy_toml = s:dein_dir . '/.dein_lazy.toml'

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
colorscheme hybrid
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
      \   'anzu': 'anzu#search_status'
      \ }
      \ }

" anzu {{{
nmap n nzz<Plug>(anzu-update-search-status)
nmap N Nzz<Plug>(anzu-update-search-status)
nmap * <Plug>(anzu-star)
nmap # <Plug>(anzu-sharp)
" }}}

" incsearch {{{
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
" }}}


" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
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

" filetype {{{
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.ts set filetype=typescript.tsx
au BufRead,BufNewFile *.tsx set filetype=typescript.tsx
au BufRead,BufNewFile *.js set filetype=javascript.jsx
au BufRead,BufNewFile *.jsx set filetype=javascript.jsx
" }}}

" nerdcommenter {{{
let NERDSpaceDelims = 1
nmap ; <Plug>NERDCommenterToggle
vmap ; <Plug>NERDCommenterToggle
" }}}

" context_filetype vim-precious {{{
let g:context_filetype#filetypes = {
      \ 'html': [
      \ {
      \ 'start': '<script>',
      \ 'end': '</script>', 'filetype': 'javascript',},
      \ {
      \ 'start': '<script\%( [^>]*\)charset="[^\"]*"\%( [^>]*\)\?>',
      \ 'end': '</script>', 'filetype': 'javascript',},
      \ {
      \ 'start': '<script\%( [^>]*\)\? type="text/javascript"\%( [^>]*\)\?>',
      \ 'end': '</script>', 'filetype': 'javascript',},
      \ {
      \ 'start': '<script\%( [^>]*\)\? type="text/coffeescript"\%( [^>]*\)\?>',
      \ 'end': '</script>', 'filetype': 'coffee',},
      \ {
      \ 'start': '<style\%( [^>]*\)\? type="text/css"\%( [^>]*\)\?>',
      \ 'end': '</style>', 'filetype': 'css',},
      \ {
      \ 'start': '<?',
      \ 'end': '?>', 'filetype': 'php',},],}
" }}}

" emmet {{{
let g:user_emmet_leader_key='<c-t>'
" }}}

" vimfiler {{{
let g:vimfiler_as_default_explorer = 1
nnoremap <silent> <Leader>fe :<C-u>VimFilerBufferDir -quit<CR>

function! UniteFileCurrentDir()
  let s  = ':Unite file -start-insert -path='
  let s .= vimfiler#get_current_vimfiler().current_dir

  execute s
endfunction

autocmd FileType vimfiler
      \ nnoremap <buffer><silent>/
      \ :call UniteFileCurrentDir() <CR>
" }}}

" template {{{
autocmd BufNewFile *.cpp 0r $HOME/.vim/template/template.cpp
" }}}

" {{{ neosnippet
let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/snippets/'
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" }}}

" deocomplete {{{
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" }}}

augroup vimrc-checktime
  autocmd!
  autocmd InsertEnter,WinEnter * checktime
augroup END

let g:flow#autoclose = 1
