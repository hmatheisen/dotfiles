-- Line numbers
vim.o.number = true
vim.o.relativenumber = true
vim.o.numberwidth = 8

-- Tab config
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.smarttab = true
vim.o.expandtab = true

-- Indent
vim.o.smartindent = true

-- Map Leader
vim.g.mapleader = " "

-- Searching
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false

-- Split the right way
vim.o.splitbelow = true
vim.o.splitright = true

-- Wildmode
vim.o.wildmode = "list:longest,list:full"

-- Don't redraw while executing macros
vim.o.lazyredraw = true

-- Don't wrap lines
vim.o.wrap = false

-- Clipboard support
vim.o.clipboard = "unnamedplus"

-- Write to undo file
vim.o.undofile = true

-- Split preview
vim.o.inccommand = "split"

-- Insert two spaces after a period with every joining of lines.
vim.o.joinspaces = true

-- Give me a prompt instead of just rejecting risky :write, :saveas
vim.o.confirm = true

-- Ruler is enough
vim.o.laststatus = 0

-- grep program
vim.o.grepprg = "rg --vimgrep"

-- Set leader
vim.g.mapleader = " "

vim.cmd [[ colorscheme quiet ]]
