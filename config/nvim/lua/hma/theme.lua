-- Some handy theme manipulations.
-- I consider a lot of UI related options to be part of a theme.
-- These functions allow me to quickly change these options by having default
-- presets and commands for them.

---@alias Preset { colorscheme: string, laststatus: 0|1|2|3, background: "light"|"dark", termguicolors: boolean }

---@class MyTheme
local M = {}

---@class MyThemeConfig
M.config = {
  ---@type Preset
  default_preset = {
    colorscheme = "default",
    laststatus = 2,
    background = "dark",
    termguicolors = true,
  },
  ---@type table<string, Preset>
  presets = {}
}

---@param args Preset
---@return nil
local function change_theme(preset)
  local default_preset = M.config.default_preset

  vim.cmd.colorscheme(preset.colorscheme or default_preset.colorscheme)
  vim.o.background = preset.background or default_preset.background
  vim.o.laststatus = preset.laststatus or default_preset.laststatus

  if type(preset.termguicolors) == "boolean" then
    vim.o.termguicolors = preset.termguicolors
  else
    vim.o.termguicolors = default_preset.termguicolors
  end
end

---@return nil
local function create_commands()
  for key, preset in pairs(M.config.presets) do
    vim.api.nvim_create_user_command(
      key,
      function() change_theme(preset) end,
      {}
    )
  end
end

---@param preset Preset
---@return nil
local function validate_preset(preset)
  vim.validate({
    colorscheme = { preset.colorscheme, 'string', true },
    background = { preset.background, 'string', true },
    laststatus = { preset.laststatus, 'number', true },
    termguicolors = { preset.termguicolors, 'boolean', true }
  })
end

---@param config MyThemeConfig
---@return nil
local function validate_config(config)
  validate_preset(config.default_preset)

  for _, preset in pairs(config.presets) do
    validate_preset(preset)
  end
end

---@return nil
function M.restore_default()
  local default_preset = M.config.default_preset

  vim.cmd.colorscheme(default_preset.colorscheme)
  vim.o.background = default_preset.background
  vim.o.laststatus = default_preset.laststatus
  vim.o.termguicolors = default_preset.termguicolors
end

---@param config MyThemeConfig
---@return nil
function M.setup(config)
  vim.validate({ config = { config, 'table', true } })
  config = vim.tbl_deep_extend('force', M.config, config or {})

  validate_config(config)

  M.config = config

  create_commands()
  M.restore_default()
end

return M
