vim.opt.termguicolors = true

vim.cmd.colorscheme "catppuccin"

vim.opt.fillchars = 'eob: ,vert: ,horiz: ,vertleft: ,vertright: ,verthoriz: ,',

require('lualine').setup {
  options = {
    theme = 'catppuccin',
    section_separators = { left = '', right = '' },
  },
}
vim.api.nvim_set_hl(0, 'WinSeparator', { ctermbg = 235 })
