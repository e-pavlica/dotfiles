return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'mason-org/mason.nvim', opts = {} },
      {
        'mason-org/mason-lspconfig.nvim',
      },
    },
    config = function()
      vim.lsp.config.denols = {
        root_dir = vim.fs.root(0, { 'deno.json', 'deno.jsonc' }),
      }
      vim.lsp.enable({
        'biome', -- ts / js style & lint
        'denols',
        'lua_ls',
        'ruff',  -- python lint & style
        'ts_ls', -- ts typechecking
        'ty',    -- python typechecking
      })
    end,
  },
}
