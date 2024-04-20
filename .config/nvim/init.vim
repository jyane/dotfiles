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

set clipboard&
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


au BufRead,BufNewFile *.md set filetype=markdown
" }}}

" {{{ plugin specific settings
colorscheme ghdark

let NERDSpaceDelims = 1
nmap ; <Plug>NERDCommenterToggle
vmap ; <Plug>NERDCommenterToggle

" }}}

" {{{ statusline
set laststatus=3
set statusline=%2*\ %{StatuslineMode()}\ %1*\ %f%=%m%h%r\%3*%{b:gitbranch}%4*%{&ff}\ %{&fileencoding?&fileencoding:&encoding}\ %5*%l:%c\ %p\ %1*\|%y
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

" {{{ lua
lua << EOF

local cmp = require'cmp'

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ['<C-f>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  })
})

local lspconfig = require'lspconfig'
lspconfig.clangd.setup{}

local lspconfig = require'lspconfig'
lspconfig.gopls.setup({
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
      usePlaceholders = true,
    },
  },
})

function fix_and_imports()
  local params = vim.lsp.util.make_range_params()
  params.context = {only = {'source.organizeImports'}}
  -- buf_request_sync defaults to a 1000ms timeout. Depending on your
  -- machine and codebase, you may want longer. Add an additional
  -- argument after params if you find that you have to write the file
  -- twice for changes to be saved.
  -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
  local result = vim.lsp.buf_request_sync(0, 'textDocument/codeAction', params)
  for cid, res in pairs(result or {}) do
    for _, r in pairs(res.result or {}) do
      if r.edit then
        local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or 'utf-16'
        vim.lsp.util.apply_workspace_edit(r.edit, enc)
      end
    end
  end
  vim.lsp.buf.format({async = false})
end

EOF

autocmd BufWritePre *.go lua fix_and_imports()
" }}}
