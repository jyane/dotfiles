require('utils')

-- Here is supposed to have plugin specific settings, but styles/lsp related settings are in each files.

vim.g.NERDSpaceDelims = 1
keymap('n', ';', '<Plug>NERDCommenterToggle')
keymap('v', ';', '<Plug>NERDCommenterToggle')

vim.g.fzf_vim = {
  preview_window = {
    'down'
  },
}
vim.g.fzf_layout = {
  window = {
    width = 0.9,
    height = 0.9,
  },
}

require("nvim-tree").setup()
