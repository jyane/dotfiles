require('utils')

-- Here is supposed to have plugin specific settings, but styles/lsp related settings are in each files.

vim.g.NERDSpaceDelims = 1
keymap('n', ';', '<Plug>NERDCommenterToggle')
keymap('v', ';', '<Plug>NERDCommenterToggle')
