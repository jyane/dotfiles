function keymap(mode, l, r)
  local opt = {
    noremap = true,
    silent = true,
  }
  vim.api.nvim_set_keymap(mode, l, r, opt)
end
