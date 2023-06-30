vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local packer = require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Theme
  use 'morhetz/gruvbox'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  -- Editor
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'tpope/vim-dispatch'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-endwise'
  use 'tpope/vim-rsi'
  use 'tommcdo/vim-lion'
  use 'easymotion/vim-easymotion'
  use 'windwp/nvim-autopairs'

  -- Snippets
  use 'SirVer/ultisnips'

  -- Lang
  use 'vim-ruby/vim-ruby'

  -- Search
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-pack/nvim-spectre'

  -- LSP
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'hrsh7th/cmp-buffer' -- Buffer source for nvim-cmp
  use 'hrsh7th/cmp-path' -- Path source for nvim-cmp
  use 'hrsh7th/cmp-nvim-lua' -- Neovim's Lua API source for nvim-cmp
  use 'hrsh7th/cmp-cmdline' -- nvim-cmp source for vim's cmdline
  use 'quangnguyen30192/cmp-nvim-ultisnips' -- nvim-cmp source for ultisnips
end)

require('plugin_config/gruvbox')
require('plugin_config/autopairs')
require('plugin_config/easyalign')
require('plugin_config/cmp')
require('plugin_config/lualine')

return packer
