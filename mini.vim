"              _
"       __   _(_)_ __ ___  _ __ ___
"       \ \ / / | '_ ` _ \| '__/ __|
"        \ V /| | | | | | | | | (__
"       (_)_/ |_|_| |_| |_|_|  \___|
"

" ==========================================
" Editor Options: {{{
" ==========================================

if !has('nvim')
  " No Vi compatibility if in Vim
  set nocompatible
  " Enable syntax
  syntax on
end

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
set cursorline

if has('nvim')
  set inccommand=split
end

" }}}
" ==========================================
" Commands: {{{
" ==========================================

" Disables automatic commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Readline style keybindings in Insert Mode (I don't like arrow keys)
imap <C-a> <Home>
imap <C-f> <right>
imap <C-b> <left>
imap <C-e> <End>

" Toggle spell check
nnoremap <leader>o :setlocal spell!<CR>

" Edit the neovim config file
nnoremap <leader>v :e ~/.config/nvim<CR>

" Toggle Highlighted search
nnoremap <leader>s :setlocal hls!<CR>

" Copy all file content to clipboard
nnoremap <leader>c :!pbcopy < %<CR>

if has('nvim')
  " Escape terminal easily
  tnoremap <Esc> <C-\><C-n>
end

" Easy switch buffers
map gn :bn<CR>
map gp :bp<CR>

" Auto close
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" }}}
