return {
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = false,
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
        }
      }

      vim.api.nvim_create_user_command("LuaLineHide", ":lua require('lualine').hide()<CR>", {})
    end
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    config = function()
      require("catppuccin").setup({
        background = { light = "latte", dark = "mocha" },
        color_overrides = { mocha = { base = "#000000" } }
      })
    end
  },
  "p00f/alabaster.nvim"
}
