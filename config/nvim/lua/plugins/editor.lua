return {
  "tpope/vim-surround",
  "tpope/vim-fugitive",
  "tpope/vim-endwise",
  "tpope/vim-rsi",
  "tommcdo/vim-lion",
  "easymotion/vim-easymotion",
  "justinmk/vim-sneak",
  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup {}
    end
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    config = function()
      require('nvim-treesitter.configs').setup({
        highlight = { enable = true, additional_vim_regex_highlighting = false },
        incremental_selection = { enable = true },
        indent = { enable = true },
        autotag = { enable = true }
      })

      vim.o.foldmethod = 'expr'
      vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
      vim.o.foldenable = false
    end
  },
  "github/copilot.vim"
}
