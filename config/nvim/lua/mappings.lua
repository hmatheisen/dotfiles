-- Mappings

-- Life changer
vim.api.nvim_set_keymap("n", " ", ":", { noremap = true })
vim.api.nvim_set_keymap("x", " ", ":", { noremap = true })

-- Shortcutting split navigation, saving a keypress
vim.api.nvim_set_keymap("", "<C-h>", "<C-w>h", {})
vim.api.nvim_set_keymap("", "<C-j>", "<C-w>j", {})
vim.api.nvim_set_keymap("", "<C-k>", "<C-w>k", {})
vim.api.nvim_set_keymap("", "<C-l>", "<C-w>l", {})

-- Toggle spell check
vim.api.nvim_set_keymap("n", ",o", ":setlocal spell!<CR>",           { noremap = true })
-- Edit the neovim config file
vim.api.nvim_set_keymap("n", ",v", ":e ~/.config/nvim/init.vim<CR>", { noremap = true })
-- Toggle Highlighted search
vim.api.nvim_set_keymap("n", ",s", ":setlocal hls!<CR>",             { noremap = true })
-- Copy all file content to clipboard
vim.api.nvim_set_keymap("n", ",c", ":!pbcopy < %<CR>",               { noremap = true })

-- Escape terminal easily
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true })

-- Mappings for quicklist navigation
vim.api.nvim_set_keymap("n", "[q", ":cprevious<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "]q", ":cnext<CR>",     { noremap = true })
vim.api.nvim_set_keymap("n", "[Q", ":cfirst<CR>",    { noremap = true })
vim.api.nvim_set_keymap("n", "]Q", ":clast<CR>",     { noremap = true })

-- Some command abbrevs
vim.cmd.cnoreabbrev("help", "vert help")
vim.cmd.cnoreabbrev("new",  "tabnew")
