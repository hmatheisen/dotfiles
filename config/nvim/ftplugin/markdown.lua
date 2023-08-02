vim.g.markdown_folding = 1

-- Forced textwidth does not really go well with markdown so:
vim.opt_local.wrap = true
vim.opt_local.linebreak = true

-- Enable cursorline so I can better see wrapped lines
vim.opt_local.cursorline = true

local function EisenhowerMatrix()
  vim.print([[
|               | Urgent         | Not Urgent         |
|---------------|----------------|--------------------|
| Important     | DO             | SCHEDULE           |
| Not Important | DELEGATE       | DELETE             |
  ]])
end

vim.api.nvim_create_user_command("EisenhowerMatrix", EisenhowerMatrix, {})
