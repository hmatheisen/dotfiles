local command = vim.api.nvim_create_user_command
local autocmd = vim.api.nvim_create_autocmd

-- format file
local format_functions = {
  ruby = "stree format --print-width=100",
  c = "clang-format",
  cpp = "clang-format",
  lua = "lua-format --indent-width=2",
  xml = "xmllint --format -",
  sh = "shfmt",
  -- TODO: maybe find a better way to handle `prettier` path
  typescriptreact = "client/node_modules/.bin/prettier",
  typescript = "client/node_modules/.bin/prettier",
  javascript = "client/node_modules/.bin/prettier"
}

local function format()
  local filetype = vim.bo.filetype
  local func = format_functions[filetype]
  local view = vim.fn.winsaveview()

  if func == nil then return end

  vim.cmd("%!" .. func .. " %")

  vim.fn.winrestview(view)
end

command("Format", format, {nargs = 0})

-- open bottom tmux pane
local function tmux_term() vim.cmd("silent !tmux split-window -v -l 15") end
command("TmuxTerm", tmux_term, {nargs = 0})

-- read !git log --no-merges --format="%s" 22.465.0..22.466.0
local function read_git_log(args)
  local cmd = "read !git log --no-merges --format=\"\\%s\""

  if (args['args']) then cmd = cmd .. " " .. args['args'] end

  vim.cmd(cmd)
end

command("ReadGitLog", read_git_log, {nargs = '*'})

local function git_diff_split(args)
  vim.cmd("new")
  vim.cmd("read !git -P diff")
  vim.cmd("0")
  vim.cmd("set filetype=diff")
  vim.cmd("set buftype=nofile")
end
command("Gdiff", git_diff_split, {nargs = 0})

local function git_diff_vsplit(args)
  vim.cmd("vnew")
  vim.cmd("read !git -P diff")
  vim.cmd("0")
  vim.cmd("set filetype=diff")
  vim.cmd("set buftype=nofile")
end
command("Gvdiff", git_diff_vsplit, {nargs = 0})

-- Insert date
command("Date", "read !date +\"\\%a \\%b \\%d \\%Y\"", {nargs = 0})

-- Copy buffer content
command("Copy", "!pbcopy < %", {nargs = 0})

-- Highlight on yank
autocmd("TextYankPost", {callback = function() vim.highlight.on_yank() end})

-- Full line text
local function full_line_text(args)
  vim.bo.textwidth = 0
  vim.wo.wrap = true
  vim.wo.linebreak = true
end

command("FullLineText", full_line_text, {nargs = 0})
