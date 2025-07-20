return {
  {
    'neovim/nvim-lspconfig',
    -- event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { 'mason-org/mason.nvim' },
      {
        'mason-org/mason-lspconfig.nvim',
        opts = {
          automatic_enable = true,
          ensure_installed = {
            'lua_ls', 'tsserver', 'deno', 'ruff_lsp', 'pyright', 'bashls',
            'dockerls', 'jsonls', 'marksman', 'rubocop', 'solargraph', 'yamlls',
          },
        },
      },
    },
    config = function()
      require('mason').setup({})
      local lspconfig = require('lspconfig')
      local mason_lspconfig = require('mason-lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
    end

    --   -- mason_lspconfig.setup_handlers ={
    --   --   function(server_name)
    --   --     lspconfig[server_name].setup {
    --   --       capabilities = capabilities,
    --   --     }
    --   --   end,
    --   --   -- ['lua_ls'] = function()
    --   --   --   lspconfig.lua_ls.setup {
    --   --   --     capabilities = capabilities,
    --   --   --     settings = {
    --   --   --       Lua = {
    --   --   --         diagnostics = {
    --   --   --           globals = { 'vim' },
    --   --   --         },
    --   --   --       },
    --   --   --     },
    --   --   --   }
    --   --   -- end,
    --   -- }
    -- end,
  },
}
