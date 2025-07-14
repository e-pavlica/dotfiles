return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-lua/plenary.nvim', -- Required by neotest
    'nvim-neotest/nvim-nio', -- Required for async operations
    'nvim-treesitter/nvim-treesitter', -- Required for syntax highlighting and parsing
    'antoinemadec/FixCursorHold.nvim', -- Recommended for better performance

    'nvim-neotest/neotest-jest',     -- For JavaScript/TypeScript Jest tests
    'nvim-neotest/neotest-python',   -- For Python tests (pytest, unittest)
    'olimorris/neotest-rspec',    -- For Ruby RSpec tests
    -- 'MarkEmmons/neotest-deno',   -- For Deno tests
    { dir = '~/projects/neotest-deno' }, -- Local path for Deno tests
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
}
