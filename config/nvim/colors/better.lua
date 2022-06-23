--- Better default colors

-- Clear syntax {{{
if vim.g.colors_name ~= nil then
  vim.api.nvim_command('highlight clear')

  if vim.opt.syntax ~= nil then
    vim.api.nvim_command('syntax reset')
  end
end

vim.g.colors_name = 'better'
-- }}}

-- Utils {{{

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
  local highlight = { 'hi', group }

  if fg ~= nil then
    local ctermfg, guifg = fg[1], fg[2]
    add(highlight, 'ctermfg=' .. ctermfg, 'guifg=' .. guifg)
  end

  if bg ~= nil then
    local ctermbg, guibg = bg[1], bg[2]
    add(highlight, 'ctermbg=' .. ctermbg, 'guibg=' .. guibg)
  end

  if style ~= nil then
    add(highlight, 'cterm=' .. style, 'gui=' .. style)
  end

  if debug == true then
    print(table.concat(highlight, ' '))
  end

  vim.api.nvim_command(table.concat(highlight, ' '))
end
-- }}}

local palette = {
  -- Basic colors
  white   = { 15,  '#ffffff' },
  black   = { 0,   '#000000' },
  blue    = { 39,  '#00afff' },
  magenta = { 207, '#ff5fff' },
  -- Greys
  grey232	= { 232, '#080808' },
  grey233	= { 233, '#121212' },
  grey234	= { 234, '#1c1c1c' },
  grey235	= { 235, '#262626' },
  grey236	= { 236, '#303030' },
  grey237	= { 237, '#3a3a3a' },
  grey238	= { 238, '#444444' },
  grey239	= { 239, '#4e4e4e' },
  grey240	= { 240, '#585858' },
  grey241	= { 241, '#626262' },
  grey242	= { 242, '#6c6c6c' },
  grey243	= { 243, '#767676' },
  grey244	= { 244, '#808080' },
  grey245	= { 245, '#8a8a8a' },
  grey246	= { 246, '#949494' },
  grey247	= { 247, '#9e9e9e' },
  grey248	= { 248, '#a8a8a8' },
  grey249	= { 249, '#b2b2b2' },
  grey250	= { 250, '#bcbcbc' },
  grey251	= { 251, '#c6c6c6' },
  grey252	= { 252, '#d0d0d0' },
  grey253	= { 253, '#dadada' },
  grey254	= { 254, '#e4e4e4' },
  grey255	= { 255, '#eeeeee' },
}

-- Highlights
-- hi(highlight, foreground, background, style)

-- Interface
hi('CursorLine',   nil,             palette.grey234, 'none')
hi('Visual',       nil,             palette.grey238, 'none')
hi('Folded',       palette.blue,    palette.grey233, 'none')
hi('LineNr',       palette.grey245, palette.black,   'none')
hi('CursorLineNr', palette.blue,    palette.grey234, 'bold')
hi('VertSplit',    palette.grey245, palette.black,   'none')
hi('StatusLine',   palette.black,   palette.grey254, 'bold')
hi('StatusLineNC', palette.white,   palette.grey230, 'none')

-- Text
hi('Normal',       palette.white,   palette.black,   'none')
hi('Statement',    palette.blue,    nil,             'none')
hi('Comment',      palette.grey245, nil,             'none')
hi('NonText',      palette.grey245, nil,             'none')
hi('Identifier',   palette.magenta, nil,             'none')

-- vim: foldlevel=0
