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

" search settings {{{
set hlsearch
set ignorecase
set smartcase
set incsearch
nmap <silent> <ESC><ESC> :nohlsearch<CR>
set wrapscan
" }}}

" indent settings {{{
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent
set smartindent
set nopaste
" }}}

" {{{ statusline
set laststatus=2
set statusline=%2*\ %{StatuslineMode()}\ %1*\ %f%=%m%h%r\%3*%{b:gitbranch}%4*%{&ff}%{&fileencoding?&fileencoding:&encoding}\ %5*%l,%c,%L%1*\ \|%y
hi User2 ctermbg=lightgreen ctermfg=black guibg=lightgreen guifg=black
hi User1 ctermbg=black ctermfg=white guibg=black guifg=white
hi User3 ctermbg=black ctermfg=lightblue guibg=black guifg=lightblue
hi User4 ctermbg=black ctermfg=lightgreen guibg=black guifg=lightgreen
hi User5 ctermbg=black ctermfg=magenta guibg=black guifg=magenta

function! StatuslineMode()
  let l:mode=mode()
  if l:mode==#"n"
    return "NORMAL"
  elseif l:mode==?"v"
    return "VISUAL"
  elseif l:mode==#"i"
    return "INSERT"
  elseif l:mode==#"R"
    return "REPLACE"
  elseif l:mode==?"s"
    return "SELECT"
  elseif l:mode==#"t"
    return "TERMINAL"
  elseif l:mode==#"c"
    return "COMMAND"
  elseif l:mode==#"!"
    return "SHELL"
  endif
endfunction

function! StatuslineGitBranch()
  let b:gitbranch=""
  if &modifiable
    try
      let l:dir=expand('%:p:h')
      let l:gitrevparse = system("git -C ".l:dir." rev-parse --abbrev-ref HEAD")
      if !v:shell_error
        let b:gitbranch="(".substitute(l:gitrevparse, '\n', '', 'g').") "
      endif
    catch
    endtry
  endif
endfunction

augroup GetGitBranch
  autocmd!
  autocmd VimEnter,WinEnter,BufEnter * call StatuslineGitBranch()
augroup END
" }}}

au BufRead,BufNewFile *.md set filetype=markdown
" }}}


let NERDSpaceDelims = 1
nmap ; <Plug>NERDCommenterToggle
vmap ; <Plug>NERDCommenterToggle
