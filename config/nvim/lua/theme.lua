local theme = require("hma.theme")
local catppuccin = require("catppuccin")
local lualine = require("lualine")

-- Themes setup
catppuccin.setup({
  background = { light = "latte", dark = "mocha" },
  color_overrides = { mocha = { base = "#000000" } }
})

-- Lualine setup
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

-- Default theme setup and create some presets
theme.setup({
  default_preset = {
    colorscheme = "catppuccin",
    background = "dark",
    laststatus = 2,
    termguicolors = true,
  },
  presets = {
    ["Light"] = {
      background = "light"
    },
    ["QuietDark"] = {
      colorscheme = "quiet",
      laststatus = 0,
      background = "dark",
    },
    ["QuietLight"] = {
      colorscheme = "quiet",
      laststatus = 0,
      background = "light",
    },
    ["RetroDark"] = {
      colorscheme = "default",
      laststatus = 0,
      background = "light",
      termguicolors = false
    }
  }
})

-- Restore theme
vim.api.nvim_create_user_command("RestoreTheme", theme.restore_default, {})
