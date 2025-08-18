-- Here is supposed to have plugin specific settings, but styles/lsp related settings are in each file.

vim.g.NERDSpaceDelims = 1
vim.g.NERDDefaultAlign ='left'
vim.keymap.set('n', ';', '<Plug>NERDCommenterToggle')
vim.keymap.set('v', ';', '<Plug>NERDCommenterToggle')

require('nvim-tree').setup()
local nvimtree = require('nvim-tree.api')
vim.keymap.set('n', '<leader>t', nvimtree.tree.toggle)

-- {{{ telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })

local telescope = require("telescope")
local telescopeConfig = require("telescope.config")
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

table.insert(vimgrep_arguments, "--hidden")
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.git/*")

telescope.setup({
	defaults = {
		vimgrep_arguments = vimgrep_arguments,
	},
	pickers = {
		find_files = {
			find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
		},
	},
})
-- }}}
