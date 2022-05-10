local buf_map = vim.api.nvim_buf_set_keymap
local M = {}

function M.settings()
  vim.wo.linebreak = true
  vim.wo.wrap = true
  vim.bo.textwidth = 80

  buf_map(0, 'i', '<C-l>', '<c-g>u<Esc>[s1z=`]a<c-g>u', {noremap = true})
end

return M
