local keymap = vim.keymap

-- <CR> is <C-y> (accept completion) in command mode when wildmenu is displayed
keymap.set("c", "<CR>", function()
  return vim.fn.wildmenumode() == 1 and "<C-y>" or "<CR>"
end, {expr = true, remap = false})

-- <CR> is <C-y> (accept completion) in insert mode when pumvisible
keymap.set("i", "<CR>", function()
  return vim.fn.pumvisible() == 1 and "<C-y>" or "<CR>"
end, {expr = true, remap = false})

-- <Tab> is <C-n> (next completion) in insert mode when pumvisible
keymap.set("i", "<Tab>", function()
  return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
end, {expr = true, remap = false})

-- <S-Tab> is <C-p> (previous completion) in insert mode when pumvisible
keymap.set("i", "<S-Tab>", function()
  return vim.fn.pumvisible() == 1 and "<C-p>" or "<S-Tab>"
end, {expr = true, remap = false})

-- [ ] keymaps
keymap.set("n", "]b", "<cmd>bnext<CR>", {silent = true})
keymap.set("n", "[b", "<cmd>bprevious<CR>", {silent = true})

keymap.set("n", "[Q", "<cmd>cfirst<CR>", {silent = true})
keymap.set("n", "[q", "<cmd>cprevious<CR>", {silent = true})
keymap.set("n", "]q", "<cmd>cnext<CR>", {silent = true})
keymap.set("n", "]Q", "<cmd>clast<CR>", {silent = true})

-- Setup FZF main command
keymap.set("n", "<C-p>", "<cmd>FZF<CR>", {silent = true})
