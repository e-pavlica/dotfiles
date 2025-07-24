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
    keys = {
      {
        '<leader>?',
        function()
          require('which-key').show({ global = false })
        end,
        desc = 'Buffer Local Keymaps (which-key)',
      },
      {
        '<leader>p',
        '<cmd>Telescope find_files<cr>',
        desc = 'Find Files',
        mode = { 'n', 'v' },
      },
    },
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      indent = {
        char = { '|', '¦', '┆', '┊' },
      },
      scope = {
        enabled = false,
        exclude = {
          language = { 'dashboard' },
        },
      },
    },
  },
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      local db = require('dashboard')
      db.setup({
        theme = 'hyper',
        config = {
          week_header = {
            enable = true,
          },
          shortcut = {
            { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
            {
              icon = ' ',
              icon_hl = '@variable',
              desc = 'Files',
              group = 'Label',
              action = 'Telescope find_files',
              key = 'f',
            },
            {
              desc = ' Apps',
              group = 'DiagnosticHint',
              action = 'Telescope app',
              key = 'a',
            },
            {
              desc = ' dotfiles',
              group = 'Number',
              action = 'Telescope dotfiles',
              key = 'd',
            },
          },
        },
      })
    end,
    dependencies = { 'nvim-tree/nvim-web-devicons' }
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
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
}
