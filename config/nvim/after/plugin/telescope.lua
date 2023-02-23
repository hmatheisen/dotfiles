local builtin = require('telescope.builtin')

vim.keymap.set('n', '<C-t>', builtin.find_files, {})
vim.keymap.set('n', '<C-f>', builtin.live_grep, {})
vim.keymap.set('n', '<C-b>', builtin.buffers, {})
-- vim.keymap.set('n', '', builtin.help_tags, {})
