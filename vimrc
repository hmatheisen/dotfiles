" Syntax and ftplugins
syntax on
filetype plugin on

" Number line the way I like it
set number
set relativenumber
set numberwidth=8

" Status line the way I like it
set ruler
set laststatus=0

" remove timeouts when pressing ESC
set timeoutlen=1000 ttimeoutlen=0

" search as you type
set incsearch

" Mouse is fun
set mouse=a

" Write to undo file
set undofile

" Set swap directory
set undodir=~/.vim/.undo/
set backupdir=~/.vim/.backup/
set directory=~/.vim/.swp/

set autoindent " Copy indent from previous line
set smartindent " Try to indent from syntax

" Enable hidden buffers
set hidden

set splitbelow splitright

" set bg=dark
" colorscheme quiet
