" Basic settings {{{
scriptencoding utf-8

set enc=utf-8
set fenc=utf-8
set fencs=utf-8
set encoding=utf-8

set fileencodings=utf-8,sjis,shift-jis,euc-jp,utf-16,ascii,ucs-bom,cp932,iso-2022-jp
set backspace=indent,eol,start
set nobackup
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
" set nocompatible
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

let s:dein_dir = expand('~/.nvim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

execute 'set runtimepath^=' . s:dein_repo_dir


" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  let s:toml      = s:dein_dir . '/.dein.toml'
  let s:lazy_toml = s:dein_dir . '/.dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
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
" let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 400
nnoremap <silent> <Leader>uy :<C-u>Unite history/yank<CR>
nnoremap <silent> <Leader>ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> <Leader>uu :<C-u>Unite buffer file_mru<CR>
" }}}

" lightline {{{
" let g:lightline = {
      " \ 'colorscheme': 'wombat',
      " \ 'active': {
      " \   'left': [
      " \       ['mode', 'paste'],
      " \       ['readonly', 'filename', 'modified', 'anzu']
      " \   ]
      " \ },
      " \ 'component' : {
      " \   'readonly' : '%{&readonly?"⭤":""}',
      " \ },
      " \ 'component_function': {
      " \   'anzu': 'anzu#search_status',
      " \   'fugitive': 'MyFugitive',
      " \   'git-gutter': 'MyGitGutter'
      " \ },
      " \ 'separator': { 'left': '⮀', 'right': '⮂' },
      " \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      " \ }

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
" function! MyFugitive()
"   try
"     if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
"       let _ = fugitive#head()
"       return strlen(_) ? '⭠ '._ : ''
"     endif
"   catch
"   endtry
"   return ''
" endfunction

" function! MyGitGutter()
"   if ! exists('*GitGutterGetHunkSummary')
"         \ || ! get(g:, 'gitgutter_enabled', 0)
"         \ || winwidth('.') <= 90
"     return ''
"   endif
"   let symbols = [
"         \ g:gitgutter_sign_added . ' ',
"         \ g:gitgutter_sign_modified . ' ',
"         \ g:gitgutter_sign_removed . ' '
"         \ ]
"   let hunks = GitGutterGetHunkSummary()
"   let ret = []
"   for i in [0, 1, 2]
"     if hunks[i] > 0
"       call add(ret, symbols[i] . hunks[i])
"     endif
"   endfor
"   return join(ret, ' ')
" endfunction
" }}}

" vim-gitgutter {{{
" let g:gitgutter_sign_modified = '>'
" let g:gitgutter_sign_added = '+'
" let g:gitgutter_sign_removed = '-'
" }}}

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

" neocomplete {{{
" let g:acp_enableAtStartup = 0
" let g:neocomplete#enable_at_startup = 1
" let g:neocomplete#enable_smart_case = 1
" let g:neocomplete#sources#syntax#min_keyword_length = 3
" let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" " Define dictionary.
" let g:neocomplete#sources#dictionary#dictionaries = {
    " \ 'default' : '',
    " \ 'vimshell' : $HOME.'/.vimshell_hist',
    " \ 'scheme' : $HOME.'/.gosh_completions'
        " \ }

" " Define keyword.
" if !exists('g:neocomplete#keyword_patterns')
    " let g:neocomplete#keyword_patterns = {}
" endif
" let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" " Plugin key-mappings.
" inoremap <expr><C-g>     neocomplete#undo_completion()
" inoremap <expr><C-l>     neocomplete#complete_common_string()

" " Recommended key-mappings.
" " <CR>: close popup and save indent.
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function()
  " return neocomplete#close_popup() . "\<CR>"
  " " For no inserting <CR> key.
  " "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
" endfunction
" " <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" " <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><C-y>  neocomplete#close_popup()
" inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

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
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
" set completeopt = menuone
" }}}

" appearance {{{
" if &term =~ "xterm-256color" || "screen-256color"
  " set t_Co=256
  " set t_Sf=[3%dm
  " set t_Sb=[4%dm
" elseif &term =~ "xterm-color"
  " set t_Co=8
  " set t_Sf=[3%dm
  " set t_Sb=[4%dm
" endif
" vs
" }}}

" indent settings {{{
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent
set smartindent
set nopaste

" let g:indent_guides_enable_on_vim_startup=1
" let g:indent_guides_start_level=2
" let g:indent_guides_guide_size = 1
" let g:indent_guides_auto_colors=0
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#333322 ctermbg=black
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#222211 ctermbg=darkgray

if has("autocmd")
  filetype plugin on
  filetype indent on

  autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et
  autocmd FileType html       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType javascript setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scss       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType sass       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType php        setlocal sw=2 sts=2 ts=2 et
  autocmd BufNewFile,BufRead *.go set noexpandtab tabstop=4 shiftwidth=4
endif

autocmd FileType * set formatoptions-=ro
autocmd InsertLeave * set nopaste
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

" space remover {{{
autocmd BufWritePre * :%s/\s\+$//ge
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

" filetype {{{
au BufRead,BufNewFile *.md set filetype=markdown
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
" }}
