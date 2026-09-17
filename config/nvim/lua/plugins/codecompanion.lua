return {
  'olimorris/codecompanion.nvim',
  version = '^19.0.0',
  opts = {},
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    {
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { 'markdown', 'codecompanion' },
      },
      ft = { 'markdown', 'codecompanion' },
    },
  },
  init = function()
    require('codecompanion').setup({
      display = {
        chat = {
          icons = {
            chat_context = "📎️", -- You can also apply an icon to the fold
          },
          fold_context = true,
        },
        floating_window = {
          ---@return number|fun(): number
          width = function()
            return vim.o.columns - 5
          end,
          ---@return number|fun(): number
          height = function()
            return vim.o.lines - 2
          end,
          row = "center",
          col = "center",
          relative = "editor",
          opts = {
            wrap = false,
            number = false,
            relativenumber = false,
          },
        },
      },
      interactions = {
        chat = {
          adapter = 'copilot',
        },
        inline = {
          adapter = 'copilot',
        },
        cmd = {
          adapter = 'copilot',
        },
        background = {
          chat = {
            adapter = 'copilot',
            callbacks = {
              ['on_ready'] = {
                actions = {
                  'interactions.background.builtin.chat_make_title',
                },
                -- Enable 'on_ready' callback which contains the title generation action
                enabled = true,
              },
            },
            opts = {
              -- Enable background interactions generally
              enabled = true,
            },
          },
        },
      },
    })
    vim.keymap.set({ 'n', 'v' }, '<Leader>t', '<cmd>CodeCompanionActions<cr>', { noremap = true, silent = true })
    vim.keymap.set({ 'n', 'v' }, '<Leader>cc', '<cmd>CodeCompanionChat Toggle<cr>', { noremap = true, silent = true })
    vim.keymap.set('v', 'ga', '<cmd>CodeCompanionChat Add<cr>', { noremap = true, silent = true })

    -- Expand 'cc' into 'CodeCompanion' in the command line
    vim.cmd([[cab cc CodeCompanion]])
  end,
}
