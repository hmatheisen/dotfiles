local autocmd = vim.api.nvim_create_autocmd -- Create autocommand
local trim = require("utils").trim

-- Trim whitespaces on save
autocmd("BufWritePre", { pattern = "*", callback = trim })

-- Highlight text that has been yanked
autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '500' })
  end
})

-- Don't auto comment new lines
autocmd('BufEnter', {
  pattern = '',
  callback = function()
    vim.opt.formatoptions:remove { "c", "r", "o" }
  end
})
