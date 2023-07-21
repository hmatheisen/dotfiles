-- Mappings & commands

local set_keymap = vim.keymap.set
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand
local trim = require("hma.utils").trim

-- Life changer
set_keymap("n", " ", ":", { noremap = true })
set_keymap("x", " ", ":", { noremap = true })

-- Shortcutting split navigation, saving a keypress
set_keymap("", "<C-h>", "<C-w>h", {})
set_keymap("", "<C-j>", "<C-w>j", {})
set_keymap("", "<C-k>", "<C-w>k", {})
set_keymap("", "<C-l>", "<C-w>l", {})

-- Some nice commands
set_keymap("n", "<leader>o", ":setlocal spell!<CR>", { noremap = true }) -- Toggle spell check
set_keymap("n", "<leader>c", ":!pbcopy < %<CR>", { noremap = true })     -- Copy all file content to clipboard

-- Escape terminal easily
set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true })

-- Mappings for quicklist navigation
set_keymap("n", "[q", ":cprevious<CR>", { noremap = true })
set_keymap("n", "]q", ":cnext<CR>", { noremap = true })
set_keymap("n", "[Q", ":cfirst<CR>", { noremap = true })
set_keymap("n", "]Q", ":clast<CR>", { noremap = true })

-- Mappings for buffer navigation
set_keymap("n", "[b", ":bprevious<CR>", { noremap = true })
set_keymap("n", "]b", ":bnext<CR>", { noremap = true })

-- Tabs cycling
set_keymap("n", "<C-Tab>", "gt", { noremap = true })
set_keymap("n", "<C-S-Tab>", "gT", { noremap = true })

-- Some command abbrevs
vim.cmd.cnoreabbrev("new", "tabnew")
vim.cmd.cnoreabbrev("help", "vert help")
vim.cmd.cnoreabbrev("prt", "lua vim.print()<Left>")


-- Commands

-- Trim whitespaces on save
autocmd("BufWritePre", { pattern = "*", callback = trim })

-- Highlight text that has been yanked
autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '500' })
  end
})

-- Don't auto comment new lines
autocmd('BufEnter', {
  pattern = '',
  callback = function()
    vim.opt.formatoptions:remove { "c", "r", "o" }
  end
})
