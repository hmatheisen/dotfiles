local g = vim.g
local map = vim.api.nvim_set_keymap

g.NERDTreeShowHidden = 1
g.NERDTreeIgnore = { "^\\.git$", "^\\.idea$", ".swp" }
g.NERDTreeMinimalUI = 1
g.NERDTreeWinSize=45

map('n', '<leader>tt', ':NERDTreeToggle<CR>', {noremap = true})
map('n', '<leader>tf', ':NERDTreeFind<CR>', {noremap = true})

vim.cmd([[
  " Enter NERDTree when opening a directory
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
]])
