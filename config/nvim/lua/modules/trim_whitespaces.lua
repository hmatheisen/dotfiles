local M = {}
local blacklist = { 'markdown' }

function M.trim()
  local win_save = vim.fn.winsaveview()

  vim.api.nvim_exec([[keepjumps keeppatterns silent! %s/\s\+$//e]], false)

  vim.fn.winrestview(win_save)
end

function formatted_blacklist()
  local formatted_blacklist = {}

  for _, v in pairs(blacklist) do
    table.insert(formatted_blacklist, string.format("&filetype != '%s'", v))
  end

  return table.concat(formatted_blacklist, ' && ')
end

vim.cmd([[ augroup TrimWhitespaces ]])
vim.cmd([[   autocmd! ]])
vim.cmd(string.format(
  -- TODO Waiting for lua to support autocmds to make this a bit less ugly
  "autocmd BufWritePre * if %s | lua require'modules.trim_whitespaces'.trim()",
  formatted_blacklist())
)
vim.cmd([[ augroup END ]])

return M
