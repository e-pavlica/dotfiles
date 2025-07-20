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

map('n', '<leader>f', function() vim.lsp.buf.format({ async = true }) end, { desc = 'Format current buffer' })
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { desc = 'Go to definition' })
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', { desc = 'Go to declaration' })
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { desc = 'Go to references' })
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', { desc = 'Go to implementation' })
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { desc = 'Hover' })
map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', { desc = 'Rename' })
map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', { desc = 'Code action' })
