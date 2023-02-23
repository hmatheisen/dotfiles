vim.cmd.colorscheme('lunaperche')
vim.o.termguicolors = true
vim.o.background = 'dark'

-- Theme helper function {{{

local debug = false

--- Adds multiple elements to a table
local function add(_table, ...)
  local args = {...}
  local size = table.getn(_table)

  for i, v in ipairs(args) do
    table.insert(_table, size + i, v)
  end

  return _table
end

--- Generates a highlight table and runs is as a vim command
local function hi(group, fg, bg, style)
  local highlight = { 'hi!', group }

  if fg ~= nil then
    local ctermfg, guifg = fg[1], fg[2]
    add(highlight, 'ctermfg=' .. ctermfg, 'guifg=' .. guifg)
  else
    add(highlight, 'ctermfg=none', 'guifg=none')
  end

  if bg ~= nil then
    local ctermbg, guibg = bg[1], bg[2]
    add(highlight, 'ctermbg=' .. ctermbg, 'guibg=' .. guibg)
  else
    add(highlight, 'ctermbg=none', 'guibg=none')
  end

  if style ~= nil then
    add(highlight, 'cterm=' .. style, 'gui=' .. style)
  end

  if debug == true then
    print(table.concat(highlight, ' '))
  end

  vim.api.nvim_command(table.concat(highlight, ' '))
end

local function hi_link(from_group, to_group)
  vim.api.nvim_command('hi! link ' .. from_group .. ' ' .. to_group)
end

-- }}}

local palette = {
  -- color = { term, gui }
  black = { 0, '#000000' },
  white = { 15, '#ffffff' },
  grey = { 8, '#808080' },
  dark_grey = { 238, '#444444' }
}

hi('MatchParen', nil, nil, 'none')
hi('VertSplit', palette.white, palette.black, 'none')

-- vim:foldlevel=0
