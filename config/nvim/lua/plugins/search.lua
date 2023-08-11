return {
  {
    "nvim-pack/nvim-spectre",
    config = function()
      require('spectre').setup({ live_update = true })
    end,
    cmd = "Spectre"
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
      local telescope = require('telescope')

      telescope.load_extension('fzf')
      telescope.load_extension('file_browser')

      telescope.setup {
        pickers = {
          colorscheme = {
            enable_preview = true
          }
        }
      }
    end,
    cmd = "Telescope",
    keys = {
      { "<leader>t", ":Telescope " },
      { "<leader>f", "<cmd>Telescope find_files<CR>" },
      { "<leader>g", "<cmd>Telescope live_grep<CR>" },
      { "<leader>b", "<cmd>Telescope buffers<CR>" },
      { "<leader>h", "<cmd>Telescope help_tags<CR>" },
      { "<leader>s", "<cmd>Telescope grep_string<CR>" },
      { "<leader>r", "<cmd>Telescope registers<CR>" },
      { "<leader>r", "<cmd>Telescope marks<CR>" },
      { "gr",        "<cmd>Telescope lsp_references<CR>" },
      { "gi",        "<cmd>Telescope lsp_implementations<CR>" },
    }
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  }
}
