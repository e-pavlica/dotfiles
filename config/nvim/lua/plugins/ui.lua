return {
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {},
  },
  'ryanoasis/vim-devicons',
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      indent = {
        char = { '|', '¦', '┆', '┊' },
      },
      scope = { enabled = false },
    },
  },
}
