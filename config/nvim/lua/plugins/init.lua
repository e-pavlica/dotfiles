local map = vim.keymap.set

return {
  {
    'folke/lazydev.nvim',
    ft = 'lua', -- only load on lua files
  },
  {
    'Lokaltog/vim-easymotion',
    init = function()
      vim.g.EasyMotion_startofline = 0
      map('n', '<Leader>l', '<Plug>(easymotion-lineforward)')
      map('n', '<Leader>j', '<Plug>(easymotion-j)')
      map('n', '<Leader>k', '<Plug>(easymotion-k)')
      map('n', '<Leader>h', '<Plug>(easymotion-linebackward)')
    end
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    ---@module 'ibl'
    ---@type ibl.config
    opts = {
      indent = {
        char = { '|', '¦', '┆', '┊' },
      }
    },
  },
  {
    'klen/nvim-config-local',
    config = function()
      require('config-local').setup {
        -- Config file patterns to load (lua supported)
        config_files = { '.nvim.lua', '.nvimrc', '.exrc' },

        -- Where the plugin keeps files data
        hashfile = vim.fn.stdpath('data') .. '/config-local',

        autocommands_create = true, -- Create autocommands (VimEnter, DirectoryChanged)
        commands_create = true,     -- Create commands (ConfigLocalSource, ConfigLocalEdit, ConfigLocalTrust, ConfigLocalDeny)
        silent = false,             -- Disable plugin messages (Config loaded/denied)
        lookup_parents = false,     -- Lookup config files in parent directories
      }
    end
  },
  -- 'HerringtonDarkholme/yats.vim',
  -- 'pangloss/vim-javascript',
  'pbrisbin/vim-mkdir',
  -- 'rust-lang/rust.vim',
  'ryanoasis/vim-devicons',
  'tpope/vim-abolish',
  'tpope/vim-bundler',
  'tpope/vim-commentary',
  'tpope/vim-endwise',
  'tpope/vim-eunuch',
  'tpope/vim-fugitive',
  'tpope/vim-repeat',
  'tpope/vim-rhubarb',
  'tpope/vim-surround',
  'tpope/vim-vinegar',
  -- 'vim-python/python-syntax',
  -- 'xolox/vim-misc',
}
