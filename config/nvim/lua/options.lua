-- ~/.config/nvim/lua/options.lua

-- Core Vim/Neovim Settings
vim.g.skip_defaults = true
vim.g.hlsearch = false               -- Highlight search results
vim.g.mapleader = ' '                -- Leader key, use vim.g for global variables
vim.g.mouse = false                     -- Disable mouse support
vim.opt.autowrite = true             -- Automatically :write before running commands
vim.opt.backspace = 'indent,eol,start' -- 2 in Vim means 'indent,eol,start'
vim.opt.backup = false               -- nobackup
vim.opt.cursorline = true            -- highlight the line the cursor is on
vim.opt.encoding = 'utf-8'
vim.opt.history = 50
vim.opt.incsearch = true             -- do incremental searching
vim.opt.laststatus = 2               -- Always display the status line
vim.opt.ruler = true                 -- show the cursor position all the time
vim.opt.showcmd = true               -- display incomplete commands
vim.opt.swapfile = false             -- noswapfile
vim.opt.title = true                 -- Send filename to terminal
vim.opt.writebackup = false          -- nowritebackup

-- Tabs and Indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true             -- Use spaces instead of tabs

-- Text Width and Wrapping
vim.opt.textwidth = 100
vim.opt.colorcolumn = '101'          -- +1 from textwidth 100

-- Code Folding
vim.opt.foldlevel = 25               -- Don't fold up initially
vim.opt.foldmethod = 'syntax'

-- Show Invisible Characters
vim.opt.list = true
vim.opt.listchars = { tab = '▸ ', eol = '¬' } -- Note: Lua table for listchars

-- Numbers
vim.opt.number = true
vim.opt.numberwidth = 5

-- Syntax Highlighting Performance
vim.opt.synmaxcol = 200              -- Disable syntax highlighting after 200 columns

-- Tab Completion (wildmenu)
vim.opt.wildmenu = true
vim.opt.wildmode = 'longest:full,full'
vim.opt.wildoptions = 'pum'

-- Window Splitting
vim.opt.splitbelow = true            -- Open new split panes to bottom
vim.opt.splitright = true            -- Open new split panes to right

-- Spell Check
-- The `spellfile` option can be set here. Ensure the directory exists.
vim.opt.spellfile = vim.fn.expand('$HOME') .. '/.vim-spell-en.utf-8.add'

-- Diff
vim.opt.diffopt:append('vertical')   -- Always use vertical diffs

-- Terminal Colors
vim.opt.termguicolors = true         -- Enable true color support if your terminal supports it.

-- Ripgrep (grepprg) - This can be set here, but LSP or other tools might override.
-- Note: `vim.opt.grepprg` is an option, not a global variable.
-- The value needs to be a string.
vim.opt.grepprg = 'rg'
