return {
  {
    'nvim-treesitter/nvim-treesitter', -- Required for syntax highlighting and parsing
    build = ':TSUpdate', -- Automatically update treesitter parsers
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          'bash', 'css', 'csv', 'diff', 'dockerfile', 'git_config',
          'git_rebase', 'gitcommit', 'gitignore', 'go', 'html', 'javascript',
          'json', 'jsonc', 'lua', 'make', 'markdown', 'markdown_inline',
          'python', 'regex', 'ruby', 'rust', 'scss', 'sql', 'toml',
          'tsx', 'typescript', 'vim', 'yaml',
        },
        auto_install = true, -- Automatically install missing parsers
        highlight = {
          enable = true, -- Enable syntax highlighting
          additional_vim_regex_highlighting = false, -- Disable additional regex highlighting
        },
        indent = {
          enable = true, -- Enable indentation based on treesitter
        },
        incremental_selection = {
          enable = true, -- Enable incremental selection
          keymaps = {
            init_selection = '<C-n>', -- Start selection with Ctrl+n
            node_incremental = '<C-n>', -- Increment selection to next node
            scope_incremental = '<C-s>', -- Increment selection to next scope
            node_decremental = '<C-p>', -- Decrement selection to previous node
          },
        },
      })
    end,
  }
}
