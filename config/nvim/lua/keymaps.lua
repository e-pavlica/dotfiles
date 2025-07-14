local map = vim.keymap.set

-- Leader
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- Get off my lawn
map('n', '<Left>', ':echoe \'Use h\'<CR>', { desc = 'Use h' })
map('n', '<Right>', ':echoe \'Use l\'<CR>', { desc = 'Use l' })
map('n', '<Up>', ':echoe \'Use k\'<CR>', { desc = 'Use k' })
map('n', '<Down>', ':echoe \'Use j\'<CR>', { desc = 'Use j' })

-- Quicker window movement
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-h>', '<C-w>h')
map('n', '<C-l>', '<C-w>l')

-- Convert Single Quotes to Double Quotes
map('v', "<Leader>'", ":s/\"/'/g<CR>")
-- Convert Double Quotes to Single Quotes
map('v', "<Leader>\"", ":s/'/\"/g<CR>")

-- Neotest Mappings
map('n', '<leader>tn', function() require('neotest').run.run() end, { desc = 'Run nearest test' })
map('n', '<leader>tt', function() require('neotest').run.run(vim.fn.expand('%')) end, { desc = 'Run current file tests' })
map('n', '<leader>ts', function() require('neotest').run.stop() end, { desc = 'Stop tests' })
map('n', '<leader>tf', function() require('neotest').run.run({strategy = "dap", suite = "failed"}) end, { desc = 'Run failed tests' })
map('n', '<leader>to', function() require('neotest').output.open({ enter = true }) end, { desc = 'Open test output' })
map('n', '<leader>tS', function() require('neotest').summary.toggle() end, { desc = 'Toggle test summary' })
map('n', '<leader>td', function() require('neotest').run.run({strategy = "dap"}) end, { desc = 'Debug current file tests' })
--
