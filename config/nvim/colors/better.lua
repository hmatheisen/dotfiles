if vim.g.colors_name ~= nil then
  vim.api.nvim_command('highlight clear')
end

local function add(_table, ...)
  local args = {...}
  local size = table.getn(_table)

  for i, v in ipairs(args) do
    table.insert(_table, size + i, v)
  end

  return _table
end

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

  -- print(table.concat(highlight, ' '))
  vim.api.nvim_command(table.concat(highlight, ' '))
end

local palette = {
  white = { 15, '#ffffff' },
  black = { 0, '#000000' }
}

hi('Normal', palette.white, palette.black, 'none')

