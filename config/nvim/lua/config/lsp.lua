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
