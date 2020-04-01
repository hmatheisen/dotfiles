"              _
"       __   _(_)_ __ ___  _ __ ___
"       \ \ / / | '_ ` _ \| '__/ __|
"        \ V /| | | | | | | | | (__
"       (_)_/ |_|_| |_| |_|_|  \___|
"

" ==========================================
" Editor Options: {{{
" ==========================================

" Enable syntax
syntax on

" Colorscheme
set termguicolors
set background=dark

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

" Fix backspace indent
set backspace=indent,eol,start

" Indentation
set autoindent  " Copy indent from previous line
set smartindent " Indent from syntax

" Tab config
set tabstop=2      " Number of spaces per tab
set softtabstop=2  " Number of spaces for tab operations
set shiftwidth=2   " Number of spaces for autoindent
set expandtab      " Use appropriate number os spaces when inserting tabs
set smarttab       " act according to previous options

" Map leader to ,
let mapleader=','

" Enable hidden buffers
set hidden

" Searching
set nohlsearch     " Do not highlight search results
set incsearch      " Search as letters are typed
set ignorecase     " Ignore case

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults. (Copyrights LukeSmithxyz)
set splitbelow splitright

" Set command completion
set wildmode=list:longest,full
set wildmenu
set wildignorecase

" Relative Numbers
set nu rnu

" No Word Wrap
set nowrap

" Set spell lang
set spelllang=fr,en_gb

" Set Shell
set shell=/usr/local/bin/bash

" Set swap directory
set directory^=$HOME/.vimswap//

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Fold
set foldenable
set foldmethod=marker
set foldlevel=99

" Clipboard support
set clipboard=unnamedplus

" Number of items on completion
set pumheight=10

" Write to undo file
set undofile

" }}}
" ==========================================

source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/mappings.vim

