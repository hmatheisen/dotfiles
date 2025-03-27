vim.cmd [[
  packadd nvim-treesitter
  packadd copilot.vim
]]

local treesitter = require("nvim-treesitter.configs")

-- Treesitter
treesitter.setup {
  highlight = {enable = true},
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<leader>s",
      node_incremental = "<leader>i",
      node_decremental = "<leader>o"
    }
  },
  indent = {enable = true, disable = {"ruby"}}
}

-- Disable Copilot in some filetypes
vim.g.copilot_filetypes = {text = false}
