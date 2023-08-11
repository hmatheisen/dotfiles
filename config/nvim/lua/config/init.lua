local theme = require("utils.theme")

local M = {}

local function load_config(file)
  require("config." .. file)
end

local function init_lazy()
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)

  -- Load "plugins/" dir
  require("lazy").setup("plugins")
end

local function init_theme()
  theme.setup({
    default_preset = {
      colorscheme = "github_dark_high_contrast",
      background = "dark",
      laststatus = 2,
      termguicolors = true,
    },
    presets = {
      ["DefaultTheme"] = { colorscheme = "default", termguicolors = false },
      ["Light"] = { colorscheme = "github_light", background = "light" },
      ["QuietDark"] = { colorscheme = "quiet", laststatus = 0, background = "dark", },
      ["QuietLight"] = { colorscheme = "quiet", laststatus = 0, background = "light", },
      ["SimpleLight"] = { colorscheme = "alabaster", background = "light", termguicolors = true },
      ["SimpleDark"] = { colorscheme = "alabaster", background = "dark", termguicolors = true },
      ["RetroDark"] = { colorscheme = "default", laststatus = 0, background = "light", termguicolors = false
      }
    }
  })

  -- Restore theme
  vim.api.nvim_create_user_command("RestoreTheme", theme.restore_default, {})
end

function M.setup()
  -- Load core config
  load_config("basics")
  load_config("mappings")
  load_config("autocmds")

  -- Load lazy
  init_lazy()

  -- Theme settings
  init_theme()
end

return M
