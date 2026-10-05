local map = vim.keymap.set

return {
  {
    'folke/lazydev.nvim',
    ft = 'lua',
  },
  {
    'klen/nvim-config-local',
    config = function()
      require('config-local').setup {
        config_files = { '.nvim.lua', '.nvimrc', '.exrc' },
        hashfile = vim.fn.stdpath('data') .. '/config-local',

        autocommands_create = true,
        commands_create = true,
        silent = false,
        lookup_parents = true,
      }
    end
  },
  {
    'ntpeters/vim-better-whitespace',
    config = function()
      vim.g.better_whitespace_filetypes_blacklist = {
        'snacks_dashboard',
        'dashboard',
      }
    end,
    lazy = true,
    event = 'VimEnter',
  },
  'nvim-treesitter/nvim-treesitter',
  'pbrisbin/vim-mkdir',
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    ---@type Flash.Config
    opts = {
      {
        modes = {
          char = {
            jump_labels = true
          }
        }
      }
    },
    keys = {
      { 's', mode = { 'n', 'x', 'o' }, function() require('flash').jump() end,       desc = 'Flash' },
      { 'S', mode = { 'n', 'x', 'o' }, function() require('flash').treesitter() end, desc = 'Flash Treesitter' },
      {
        '<Leader>l',
        function()
          require("flash").jump({
            search = { mode = "search", max_length = 0 },
            label = { after = { 0, 0 } },
            pattern = "^"
          })
        end,
        desc = 'Jump to line'
      },
      { '<c-s>', mode = { 'c' }, function() require('flash').toggle() end, desc = 'Toggle Flash Search' },
    },
  },
  'tpope/vim-abolish',
  'tpope/vim-commentary',
  'tpope/vim-eunuch',
  'tpope/vim-fugitive',
  'tpope/vim-repeat',
  'tpope/vim-surround',
}
