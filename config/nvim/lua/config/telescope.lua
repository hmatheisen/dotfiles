local map = vim.api.nvim_set_keymap

local function telescope_map(key, fn)
  map('n', "<leader>" .. key, fn, { noremap = true })
end


telescope_map('ff', ':Telescope find_files<cr>')
telescope_map('fg', ':Telescope live_grep<cr>')
telescope_map('fb', ':Telescope buffers<cr>')
telescope_map('fh', ':Telescope help_tags<cr>')
