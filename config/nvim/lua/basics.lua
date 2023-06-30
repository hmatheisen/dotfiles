-- Basics

-- Encoding
vim.o.encoding = "utf-8"
vim.o.fileencoding = "utf-8"
vim.o.fileencodings = "utf-8"

-- Show cursor line
-- vim.o.cursorline = true

-- Indentation
vim.o.smartindent = true

-- No hidden buffers
vim.o.hidden = false

-- Tab config
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true

-- Map Leader
vim.g.mapleader = ","

-- Searching
vim.o.hlsearch = true
vim.o.ignorecase = true

-- Split the right way
vim.o.splitbelow = true
vim.o.splitright = true

-- Set command completion
vim.o.wildmode = "list:longest,full"
vim.o.wildignorecase = true

-- Set width for line numbers
vim.o.numberwidth = 8

-- Relative line numbers
vim.o.number = true
vim.o.relativenumber = true

-- Don't redraw while executing macros
vim.o.lazyredraw = true

-- For regex magic
vim.o.magic = true

-- No wrap by default
-- I enable it for certain file types
vim.o.wrap = false

-- Fold
vim.o.foldenable = true
vim.o.foldmethod = "marker"
vim.o.foldenable = 99

-- Clipboard support
vim.o.clipboard = "unnamedplus"

-- Write to undo file
vim.o.undofile = true

-- Default shell
vim.o.shell="/usr/bin/env zsh"

-- Show split preview for some commands
vim.o.inccommand = "split"

-- Insert two spaces after a period with every joining of lines.
vim.o.joinspaces = true

-- Give me a prompt instead of just rejecting risky :write, :saveas
vim.o.confirm = true

-- Format options
vim.opt.formatoptions:remove { "c", "r", "o" }

-- Term GUI Colors
vim.o.termguicolors = true

-- Custom status line
-- TODO: Handle this in a better lua-esque way
-- vim.cmd[[
-- set statusline=
-- set statusline+=\ %f     " Path to file
-- set statusline+=\ %m     " Modified flag
-- set statusline+=\ %q     " quick list
-- set statusline+=\ %w     " Preview flag
-- set statusline+=\ %r     " Read-only flag
-- set statusline+=%=       " Go to other side
-- set statusline+=%y       " File type
-- set statusline+=\ %4l:%c " line number : column number
-- set statusline+=\ %4P    " Percentage
-- set statusline+=\        " Leave empty space
-- ]]
