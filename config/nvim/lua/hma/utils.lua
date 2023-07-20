local M = {}

-- Filetypes blacklist where NOT to apply trim
M.trim_blacklist = { 'markdown' }

function M.trim()
  -- Early return if filetype is in blacklist
  for _, v in pairs(M.trim_blacklist) do
    if vim.bo.filetype == v then
      return
    end
  end

  local win_save = vim.fn.winsaveview()

  vim.cmd([[keepjumps keeppatterns silent! %s/\s\+$//e]])
  vim.fn.winrestview(win_save)
end

return M
