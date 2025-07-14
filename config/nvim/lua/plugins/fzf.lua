local map = vim.keymap.set

return {
  {
    'ibhagwan/fzf-lua',
    init = function()
      map('n', '<C-p>', ':FzfLua files')
    end
  }
}
