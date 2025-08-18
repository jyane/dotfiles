local cmp = require'cmp'
local lspconfig = require'lspconfig'

vim.keymap.set('n', '<leader>s', vim.diagnostic.open_float, { desc = 'Open message float' })
vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, { desc = 'Go to reference' })

cmp.setup{
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-f>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ['<TAB>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  })
}

-- {{{ C/C++
lspconfig.clangd.setup{
  on_attach = on_attach,
}
-- }}}

-- {{{ Go

lspconfig.gopls.setup{
  on_attach = on_attach,
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
}

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


vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  pattern = '*.go',
  callback = fix_and_imports,
})

--- }}}

-- {{{ typescript
require'lspconfig'.ts_ls.setup{}
-- }}}
