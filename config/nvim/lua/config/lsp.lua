-- vim.lsp.enable('deno')
-- vim.lsp.enable('luals')
-- vim.lsp.enable('tsserver')

-- vim.lsp.config('ruff', {
--   init_options = {
--     settings = {
--       configurationPreference = 'filesystemFirst'
--     }
--   }
-- })

-- -- vim.lsp.enable('ruff') -- not enabled by default

vim.diagnostic.config({
  virtual_text = true,
  signs = { text = {
    [vim.diagnostic.severity.ERROR] = ' ',
    [vim.diagnostic.severity.WARN] = ' ',
    [vim.diagnostic.severity.HINT] = ' ',
    [vim.diagnostic.severity.INFO] = ' ' },
  },
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = 'rounded',
    focusable = false,
    source = true,
    header = '',
    prefix = '',
  },
})



