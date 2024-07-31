local function my_statusline()
  local statusline = ""

  local add_section = function(section)
    statusline = statusline .. section
  end

  local add_space = function() add_section(" ") end

  local add_git_branch = function()
    local branch =
        vim.fn.system("git symbolic-ref --short HEAD 2> /dev/null")
        :gsub("\n", "")

    if branch ~= "" then
      add_section("[" .. branch .. "]")
    end
  end

  add_space()
  add_section("%f")             -- File name
  add_space()
  add_section("%h")             -- Help flag
  add_section("%m")             -- Modified flag
  add_section("%r")             -- Readonly flag
  add_git_branch()              -- Git branch
  add_section("%=")             -- Right align
  add_section("%y")             -- File type
  add_space()
  add_section("%l:%c") -- Line and column number
  add_space()
  add_section("%P")             -- Percentage through file
  add_space()

  return statusline
end

vim.o.statusline = my_statusline()
