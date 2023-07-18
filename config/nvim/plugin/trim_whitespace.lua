local autocmd = vim.api.nvim_create_autocmd

-- Filetypes blacklist where NOT to apply trim
local blacklist = { 'markdown' }

local function trim()
  -- Early return if filetype is in blacklist
  for _, v in pairs(blacklist) do
    if vim.bo.filetype == v then
      return
    end
  end

  local win_save = vim.fn.winsaveview()

  vim.api.nvim_exec([[keepjumps keeppatterns silent! %s/\s\+$//e]], false)
  vim.fn.winrestview(win_save)
end

autocmd("BufWritePre", { pattern = "*", callback = trim })
