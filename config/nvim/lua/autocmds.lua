-- In ~/.config/nvim/lua/autocmds.lua
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup('CustomAutocmds', { clear = true })

-- When editing a file, always jump to the last known cursor position.
autocmd('BufReadPost', {
  group = 'CustomAutocmds',
  callback = function()
    if vim.bo.filetype ~= 'gitcommit' and vim.fn.line('\'"') > 0 and vim.fn.line('\'"') <= vim.fn.line('$') then
      vim.cmd('normal! g`"')
    end
  end,
})
autocmd({ 'BufRead', 'BufNewFile' }, {
  group = 'CustomAutocmds',
  pattern = { '*.md' },
  command = 'set filetype=markdown spell textwidth=80',
})
