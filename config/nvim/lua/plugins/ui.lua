return {
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {},
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        options = {
          theme = 'base16',
          component_separators = {
            left = '',
            right = '',
          },
          section_separators = {
            left = '',
            right = '',
          },
        }
      })
    end
  },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      defaults = {
        -- winblend = 30,
      },
    },
  },
}
