local command = vim.api.nvim_create_user_command

-- format file
local format_functions = {
  ruby = "stree format --print-width=100",
  c = "clang-format",
  cpp = "clang-format",
  lua = "lua-format --indent-width=2",
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

-- read !git diff --name-only 22.464.0..22.465.0 | grep db/migrate/
local function read_migrate_diff(args)
  local range = args['args']
  local cmd = "read !git diff --name-only " .. range .. " | grep db/migrate"

  vim.cmd(cmd)
end

command("ReadMigrateDiff", read_migrate_diff, {nargs = 1})

-- Insert date
command("Date", "read !date +\"\\%a \\%b \\%d \\%Y\"", {nargs = 0})
