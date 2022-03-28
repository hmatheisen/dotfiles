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
  use {
    'preservim/nerdtree',
    config = function() require('config.nerdtree') end
  }

  -- Some editor additions
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'easymotion/vim-easymotion'
  use 'godlygeek/tabular'
  use 'junegunn/vim-easy-align'
  use 'Raimondi/delimitMate'
  use 'tpope/vim-endwise'

  -- Prose writing
  use 'junegunn/goyo.vim'

  -- Snippets
  use 'SirVer/ultisnips'

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function() require('config.treesitter') end
  }

  -- Search
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = function() require('config.telescope') end
  }

  -- Highlight colors
  use {
    'norcalli/nvim-colorizer.lua',
    ft = { 'css', 'javascript', 'vim', 'html' },
    config = function()
      require('colorizer').setup {'css', 'javascript', 'vim', 'html'}
    end
  }

  -- Version Control
  use 'tpope/vim-fugitive'

  -- Lang
  use 'maxbane/vim-asm_ca65'
end)
