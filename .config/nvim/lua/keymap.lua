vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<leader><leader>', ':w<CR>', { desc = 'Save' })
vim.keymap.set('n', '<leader>q', ':q<CR>', { desc = 'Quit' })
vim.keymap.set('n', '<leader>-', ':sp<CR>', { desc = 'Split horizontally' })
vim.keymap.set('n', '<leader>|', ':vs<CR>', { desc = 'Split vertically' })

vim.keymap.set('n', 'k', 'gk', { desc = 'Scroll up anyway' })
vim.keymap.set('n', 'j', 'gj', { desc = 'Scroll down anyway' })

vim.keymap.set('i', '{', '{}<left>', { desc = 'Close {}' })
vim.keymap.set('i', '[', '[]<left>', { desc = 'Close ()' })
vim.keymap.set('i', '(', '()<left>', { desc = 'Close []' })
vim.keymap.set('i', '[', '[]<left>', { desc = "Close ''" })
vim.keymap.set('i', '"', '""<left>', { desc = 'Close ""' })

vim.keymap.set('n', '<esc><esc>', ':nohlsearch<CR>', { desc = 'Suppress search highlitghts' })
