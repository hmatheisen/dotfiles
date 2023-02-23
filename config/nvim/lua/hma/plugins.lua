vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Tree view
  use 'preservim/nerdtree'

  -- Some editor additions
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'easymotion/vim-easymotion'
  use 'junegunn/vim-easy-align'
  use 'tpope/vim-endwise'
  use 'jiangmiao/auto-pairs'

  -- Colorscheme
  use {
    'nanotech/jellybeans.vim',
    setup = function()
      vim.g.jellybeans_overrides = {
        ["background"] = { ["guibg"] = "000000" },
        ["VertSplit"]  = { ["guibg"] = "000000" }
      }
    end
  }

  -- Telescope for fzf and rg
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = {{ 'nvim-lua/plenary.nvim' }},
  }

  -- Prose writing
  use 'junegunn/goyo.vim'

  -- Snippets
  use 'SirVer/ultisnips'

  -- Version Control
  use 'tpope/vim-fugitive'

  -- Lang
  use 'maxbane/vim-asm_ca65'
  use 'fatih/vim-go'
  use 'vim-ruby/vim-ruby'

  -- Autocompletion/LSP
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'hrsh7th/cmp-buffer' -- Buffer source for nvim-cmp
  use 'hrsh7th/cmp-path' -- Path source for nvim-cmp
  use 'hrsh7th/cmp-nvim-lua' -- Neovim's Lua API source for nvim-cmp
  use 'hrsh7th/cmp-cmdline' -- nvim-cmp source for vim's cmdline
end)
