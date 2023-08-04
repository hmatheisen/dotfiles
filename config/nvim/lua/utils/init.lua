local M = {}

--- TRIM {{{

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

--- }}}

--- FORMAT {{{

M.format_config = {
  ruby            = "bundle exec stree write --print-width=100 %",
  typescript      = "yarn prettier --write %",
  typescriptreact = "yarn prettier --write %",
  javascript      = "yarn prettier --write %",
  sql             = "pg_format --inplace %",
}

-- Requires vim-dispatch
function M.format()
  for ft, command in pairs(M.format_config) do
    if ft ~= vim.bo.filetype then
      goto continue
    end

    vim.cmd("Dispatch! " .. command)

    ::continue::
  end
end

vim.api.nvim_create_user_command("Format", M.format, {})

--- }}}

--- INDENT {{{

M.indent_config = {
  cs   = { size = 4, use_tabs = false },
  sql  = { size = 4, use_tabs = false },
  c    = { size = 4, use_tabs = true },
  go   = { size = 4, use_tabs = true },
  make = { size = 4, use_tabs = true },
}

function M.set_indent()
  for ft, config in pairs(M.indent_config) do
    if ft ~= vim.bo.filetype then
      goto continue
    end

    vim.opt_local.tabstop = config.size
    vim.opt_local.softtabstop = config.size
    vim.opt_local.shiftwidth = config.size
    vim.opt_local.expandtab = not config.use_tabs

    ::continue::
  end
end

--- }}}

return M
