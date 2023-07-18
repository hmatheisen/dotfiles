-- Some handy theme manipulations.
-- I consider a lot of UI related options to be part of a theme.
-- These functions allow me to quickly change these options by having default
-- presets and commands for them.

local catppuccin = require("catppuccin")
local lualine = require("lualine")

--- Default theme is kept here for easy restore
local default_state = {
  theme = "catppuccin",
  laststatus = 2,
  background = "dark",
  termguicolors = true,
}

---@param args { theme: string, background: string, laststatus: number, termguicolors: boolean }
---@return nil
local function change_theme(args)
  vim.cmd.colorscheme(args.theme or default_state.theme)
  vim.o.background = args.background or default_state.background
  vim.o.laststatus = args.laststatus or default_state.laststatus

  if vim.o.laststatus == 0 then
    lualine.hide()
  end

  if type(args.termguicolors) == "boolean" then
    vim.o.termguicolors = args.termguicolors
  else
    vim.o.termguicolors = default_state.termguicolors
  end
end

---@return nil
local function restore()
  vim.cmd.colorscheme(default_state.theme)
  vim.o.background = default_state.background
  vim.o.laststatus = default_state.laststatus
  vim.o.termguicolors = default_state.termguicolors
end

---@return nil
local function init_themes()
  catppuccin.setup({
    background = { light = "latte", dark = "mocha" },
    color_overrides = { mocha = { base = "#000000" } }
  })

  lualine.setup({
    options = {
      icons_enabled = false,
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch', 'diff', 'diagnostics' },
      lualine_c = { 'filename' },
      lualine_x = { 'encoding', 'fileformat', 'filetype' },
      lualine_y = { 'progress' },
      lualine_z = { 'location' }
    },
  })

  restore()
end

---@return nil
local function quiet_dark()
  change_theme({ theme = "quiet", background = "dark", laststatus = 0 })
end

---@return nil
local function quiet_light()
  change_theme({ theme = "quiet", background = "light", laststatus = 0 })
end

---@return nil
local function dark()
  change_theme({ background = "dark" })
end

---@return nil
local function light()
  change_theme({ background = "light" })
end

---@return nil
local function retro()
  change_theme({
    theme = "default",
    background = "light",
    laststatus = 0,
    termguicolors = false
  })
end

vim.api.nvim_create_user_command('Light', light, {})
vim.api.nvim_create_user_command('Dark', dark, {})
vim.api.nvim_create_user_command('QuietLight', quiet_light, {})
vim.api.nvim_create_user_command('QuietDark', quiet_dark, {})
vim.api.nvim_create_user_command('Retro', retro, {})
vim.api.nvim_create_user_command('RestoreTheme', restore, {})

-- Calling init here sets the default theme preset
init_themes()
