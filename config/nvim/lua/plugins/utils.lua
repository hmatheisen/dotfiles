return {
  {
    "preservim/vimux",
    keys = {
      {
        ";ru",
        "<cmd>VimuxRunCommand \"bundle exec rubocop -A " .. vim.fn.expand("%") .. "\"<CR>",
        ft = "ruby"
      },
      {
        ";rs",
        "<cmd>VimuxRunCommand \"bundle exec rspec " .. vim.fn.expand("%") .. "\"<CR>",
        ft = "ruby"
      },
      {
        ";pr",
        "<cmd>VimuxRunCommand \"yarn run prettier -w " .. vim.fn.expand("%") .. "\"<CR>",
        ft = "typescriptreact"
      }
    }
  },
  "tpope/vim-vinegar"
}
