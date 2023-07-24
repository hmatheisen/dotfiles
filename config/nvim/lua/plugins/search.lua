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
    config = function() require('telescope').load_extension('fzf') end,
    keys = {
      { "<leader>f", "<cmd>Telescope find_files<CR>" },
      { "<leader>g", "<cmd>Telescope live_grep<CR>" },
      { "<leader>b", "<cmd>Telescope buffers<CR>" },
      { "<leader>h", "<cmd>Telescope help_tags<CR>" },
      { "<leader>s", "<cmd>Telescope grep_string<CR>" },
      { "<leader>r", "<cmd>Telescope registers<CR>" },
      { "gr",        "<cmd>Telescope lsp_references<CR>" },
      { "gi",        "<cmd>Telescope lsp_implementations<CR>" },
    }
  },
}
