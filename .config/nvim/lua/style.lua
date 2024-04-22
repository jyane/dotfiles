require('utils')

vim.cmd [[
  colorscheme ghdark
]]

vim.opt.fillchars = 'eob: ,vert: ,horiz: ,vertleft: ,vertright: ,verthoriz: ,',

require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'iceberg_dark',
    component_separators = { left = '|', right = '|'},
    section_separators = { left = '', right = ''},
  },
}
vim.api.nvim_set_hl(0, 'WinSeparator', { ctermbg = 235 })
