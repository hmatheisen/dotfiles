-- Mappings

-- Life changer
vim.keymap.set("n", " ", ":", { noremap = true })
vim.keymap.set("x", " ", ":", { noremap = true })

-- Shortcutting split navigation, saving a keypress
vim.keymap.set("", "<C-h>", "<C-w>h", {})
vim.keymap.set("", "<C-j>", "<C-w>j", {})
vim.keymap.set("", "<C-k>", "<C-w>k", {})
vim.keymap.set("", "<C-l>", "<C-w>l", {})

-- Some nice commands
vim.keymap.set("n", "<leader>o", ":setlocal spell!<CR>", { noremap = true }) -- Toggle spell check
vim.keymap.set("n", "<leader>c", ":!pbcopy < %<CR>", { noremap = true })     -- Copy all file content to clipboard

-- Escape terminal easily
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true })

-- Mappings for quicklist navigation
vim.keymap.set("n", "[q", ":cprevious<CR>", { noremap = true })
vim.keymap.set("n", "]q", ":cnext<CR>", { noremap = true })
vim.keymap.set("n", "[Q", ":cfirst<CR>", { noremap = true })
vim.keymap.set("n", "]Q", ":clast<CR>", { noremap = true })

-- Mappings for buffer navigation
vim.keymap.set("n", "[b", ":bprevious<CR>", { noremap = true })
vim.keymap.set("n", "]b", ":bnext<CR>", { noremap = true })

-- Tabs cycling
vim.keymap.set("n", "<C-Tab>", "gt", { noremap = true })
vim.keymap.set("n", "<C-S-Tab>", "gT", { noremap = true })

-- Some command abbrevs
vim.cmd.cnoreabbrev("new", "tabnew")
