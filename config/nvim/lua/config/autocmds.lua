local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

local utils = require("utils")
local set_indent, trim = utils.set_indent, utils.trim

-- Trim whitespaces on save
autocmd("BufWritePre", { pattern = "*", callback = trim })

-- Set proper indent
autocmd("BufEnter", { pattern = "*", callback = set_indent })

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

-- Close some file tupes wit `q`
autocmd("FileType", {
  pattern = {
    "help",
    "man",
    "spectre_panel",
    "checkhealth",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})
