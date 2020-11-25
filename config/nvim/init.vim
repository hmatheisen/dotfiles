"              _
"       __   _(_)_ __ ___  _ __ ___
"       \ \ / / | '_ ` _ \| '__/ __|
"        \ V /| | | | | | | | | (__
"       (_)_/ |_|_| |_| |_|_|  \___|
"

" ==========================================
" Editor Options: {{{
" ==========================================

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
set tabstop=4      " Number of spaces per tab
set softtabstop=4  " Number of spaces for tab operations
set shiftwidth=4   " Number of spaces for autoindent
set expandtab      " Use appropriate number os spaces when inserting tabs
set smarttab       " act according to previous options

" Map leader to ,
let mapleader=','

" Enable hidden buffers
set hidden

" Searching
set nohlsearch  " Do not highlight search results
set incsearch   " Search as letters are typed
set ignorecase  " Ignore case

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults. (Copyrights LukeSmithxyz)
set splitbelow splitright

" Set command completion
set wildmenu
set wildmode=list:longest,full
set wildignorecase

" Always show statusline
set laststatus=2

" Set width for line numbers
set numberwidth=8

" Relative Numbers
set number relativenumber

" No Word Wrap
set nowrap

" Set spell lang
set spelllang=en_gb,fr

" No spell check by default
set nospell

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

" Default shell to use
set shell=/usr/bin/env\ bash

" Use mouse for all modes
set mouse=a

" Show cursor line
" set cursorline

" Show split preview for some commands
set inccommand=split

" Netrw
let g:netrw_banner = 0       " Disable help banner
let g:netrw_liststyle = 3    " Tree like listing
let g:netrw_browse_split = 4 " Open files in previous window
let g:netrw_winsize = 85     " Window size
let g:netrw_altv = 1         " Change to right split
let g:netrw_preview = 1      " Open in vertical split

" Custom status line
set statusline=
set statusline+=\ %f     " Path to file
set statusline+=\ %m     " Modified flag
set statusline+=\ %q     " quick list
set statusline+=\ %w     " Preview flag
set statusline+=\ %r     " Read-only flag
set statusline+=%=       " Go to other side
set statusline+=%y       " File type
set statusline+=\ %4l:%c " line number : column number
set statusline+=\ %4P    " Percentage

" }}}
" ==========================================

source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/mappings.vim

