require('utils')

keymap('n', 'j', 'gj')
keymap('n', 'k', 'gk')
keymap('i', '{', '{}<left>')
keymap('i', '[', '[]<left>')
keymap('i', '(', '()<left>')
keymap('i', '"', '""<left>')
keymap('i', "'", "''<left>")
keymap('n', '<esc><esc>', ':nohlsearch<CR>')
