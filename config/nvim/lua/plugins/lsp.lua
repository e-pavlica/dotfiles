return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'mason-org/mason.nvim', opts = {} },
      {
        'mason-org/mason-lspconfig.nvim',
        -- opts = {
        --   automatic_enable = false,
        -- }
      },
    },
    config = function()
      vim.lsp.config.denols = {
        root_dir = vim.fs.root(0, { 'deno.json', 'deno.jsonc' }),
      }
    end,
  },
}
-- return {
--     "mason-org/mason-lspconfig.nvim",
--     opts = {},
--     dependencies = {
--         { "mason-org/mason.nvim", opts = {} },
--         "neovim/nvim-lspconfig",
--     },
-- }
