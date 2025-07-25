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
    'smoka7/hop.nvim',
    version = '*',
    opts = {
      keys = 'etovxqpdygfblzhckisuran'
    },
    keys = {
      { '<Leader>j', '<cmd>HopWord<cr>', desc = 'Hop to word' },
      { '<Leader>l', '<cmd>HopLine<cr>', desc = 'Hop to line' },
      { '<Leader>k', '<cmd>HopLineStart<cr>', desc = 'Hop to line start' },
      { '<Leader>h', '<cmd>HopChar1<cr>', desc = 'Hop to character' },
    },
  },
  'pbrisbin/vim-mkdir',
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
  'tpope/vim-abolish',
  'tpope/vim-commentary',
  'tpope/vim-eunuch',
  'tpope/vim-repeat',
  'tpope/vim-surround',
  -- 'tpope/vim-vinegar',
}
