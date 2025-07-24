return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-neotest/nvim-nio',
    'nvim-treesitter/nvim-treesitter',
    'antoinemadec/FixCursorHold.nvim',
    'mfussenegger/nvim-dap',

    -- Test adapters
    'nvim-neotest/neotest-jest',
    'nvim-neotest/neotest-python',
    'olimorris/neotest-rspec',
    -- 'MarkEmmons/neotest-deno',   -- For Deno tests
    { dir = '~/projects/neotest-deno' }, -- Local path for Deno tests

    -- For key bindings
    'folke/which-key.nvim',
  },
  config = function()
    vim.g.neotest_debug = true
    require('neotest').setup({
      adapters = {
        require('neotest-jest'),
        require('neotest-python'),
        require('neotest-rspec'),
        require('neotest-deno'),
      },
      -- General settings
      output = {
        enabled = true, -- Show test output in a window
      },
      summary = {
        enabled = true, -- Show test summary panel
        -- You can configure size, position etc.
      },
    })
  end,
  keys = {
      {
        "<leader>n",
        group = "🧪 Test",
        nowait = true,
        remap = false,
      },
      {
        "<leader>nr",
        "<cmd>lua require('neotest').run.run()<cr>",
        desc = "Run nearest test",
      },
      {
        "<leader>nf",
        "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>",
        desc = "Run current file",
      },
      {
        "<leader>na",
        "<cmd>lua require('neotest').run.run({ suite = true })<cr>",
        desc = "Run all tests",
      },
      {
        "<leader>nd",
        "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>",
        desc = "Debug nearest test",
      },
      {
        "<leader>ns",
        "<cmd>lua require('neotest').run.stop()<cr>",
        desc = "Stop test",
      },
      {
        "<leader>nn",
        "<cmd>lua require('neotest').run.attach()<cr>",
        desc = "Attach to nearest test",
      },
      {
        "<leader>no",
        "<cmd>lua require('neotest').output.open()<cr>",
        desc = "Show test output",
      },
      {
        "<leader>np",
        "<cmd>lua require('neotest').output_panel.toggle()<cr>",
        desc = "Toggle output panel",
      },
      {
        "<leader>nv",
        "<cmd>lua require('neotest').summary.toggle()<cr>",
        desc = "Toggle summary",
      },
      {
        "<leader>nc",
        "<cmd>lua require('neotest').run.run({ suite = true, env = { CI = true } })<cr>",
        desc = "Run all tests with CI",
      },
  }
}
