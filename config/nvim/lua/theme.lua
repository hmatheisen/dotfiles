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
  before_hook = function() end,
  ---@type table<string, Preset>
  presets = {}
}

---@param args Preset
---@return nil
local function change_theme(args)
  local default_preset = M.config.default_preset

  vim.cmd.colorscheme(args.colorscheme or default_preset.colorscheme)
  vim.o.background = args.background or default_preset.background
  vim.o.laststatus = args.laststatus or default_preset.laststatus

  if type(args.termguicolors) == "boolean" then
    vim.o.termguicolors = args.termguicolors
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

---@return nil
local function restore_default()
  local default_preset = M.config.default_preset

  vim.cmd.colorscheme(default_preset.colorscheme)
  vim.o.background = default_preset.background
  vim.o.laststatus = default_preset.laststatus
  vim.o.termguicolors = default_preset.termguicolors
end

vim.api.nvim_create_user_command("RestoreDefault", restore_default, {})

---@param preset Preset
local function validate_preset(preset)
  vim.validate({
    colorscheme = { preset.colorscheme, 'string', true },
    background = { preset.background, 'string', true },
    laststatus = { preset.laststatus, 'number', true },
    termguicolors = { preset.termguicolors, 'boolean', true }
  })
end

---@param config MyThemeConfig
local function validate_config(config)
  validate_preset(config.default_preset)

  for _, preset in pairs(config.presets) do
    validate_preset(preset)
  end
end

---@param config MyThemeConfig
---@return nil
function M.setup(config)
  vim.validate({ config = { config, 'table', true } })
  config = vim.tbl_deep_extend('force', M.config, config or {})

  validate_config(config)

  M.config = config

  M.config.before_hook()
  create_commands()
  restore_default()
end

return M
