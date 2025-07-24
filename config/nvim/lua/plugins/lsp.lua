return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'mason-org/mason.nvim', opts = {} },
      {
        'mason-org/mason-lspconfig.nvim', opts = {
          automatic_enable = false
        }
      },
    },
    init = function()
      vim.lsp.config('denols', {
        root_markers = {
          'deno.json',
          'deno.jsonc',
        },
      })
    end,
  },
}
