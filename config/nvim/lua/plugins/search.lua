return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },
  keys = {
    { "<leader>t", ":Telescope " },
    { "<leader>f", "<cmd>Telescope find_files<CR>" },
    { "<leader>g", "<cmd>Telescope live_grep<CR>" },
    { "<leader>b", "<cmd>Telescope buffers<CR>" },
    { "<leader>h", "<cmd>Telescope help_tags<CR>" },
    { "<leader>s", "<cmd>Telescope grep_string<CR>" },
    { "<leader>r", "<cmd>Telescope registers<CR>" },
    { "<leader>m", "<cmd>Telescope marks<CR>" },
    { "gr",        "<cmd>Telescope lsp_references<CR>" },
    { "gi",        "<cmd>Telescope lsp_implementations<CR>" },
  },
  config = function()
    local telescope = require('telescope')

    telescope.load_extension('fzf')

    telescope.setup {
      pickers = { colorscheme = { enable_preview = true } }
    }
  end
}
