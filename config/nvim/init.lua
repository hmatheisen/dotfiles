require("basics")
require("mappings")
require("plugins")
require("lsp")

-- Theme setup and presets
require("theme").setup({
  default_preset = {
    colorscheme = "catppuccin",
    background = "dark",
    laststatus = 2,
    termguicolors = true,
  },
  before_hook = function()
    require("catppuccin").setup({
      background = { light = "latte", dark = "mocha" },
      color_overrides = { mocha = { base = "#000000" } }
    })
    require("lualine").setup({
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
  end,
  presets = {
    ["Light"] = {
      colorscheme = "tokyonight-day",
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
