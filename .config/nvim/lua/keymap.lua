require('utils')

keymap('n', 'j', 'gj')
keymap('n', 'k', 'gk')
keymap('i', '{', '{}<left>')
keymap('i', '[', '[]<left>')
keymap('i', '(', '()<left>')
keymap('i', '"', '""<left>')
keymap('i', "'", "''<left>")
keymap('n', '<esc><esc>', ':nohlsearch<CR>')

-- LSP
keymap('n', '<space>e', '<Cmd>lua vim.diagnostic.open_float()<CR>')
keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>')
keymap('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>')
