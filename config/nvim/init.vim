"    __     _____ __  __
"    \ \   / /_ _|  \/  |
"     \ \ / / | || |\/| |
"      \ V /  | || |  | |
"       \_/  |___|_|  |_|

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

colorscheme better

" Enable 24-bit RGB color
set termguicolors

" Show cursor line
set cursorline

" Indentation
set smartindent " Indent from syntax

" Tab config
set tabstop=2      " Number of spaces per tab
set softtabstop=2  " Number of spaces for tab operations
set shiftwidth=2   " Number of spaces for autoindent
set expandtab      " Use appropriate number os spaces when inserting tabs

" Map leader to ,
let mapleader=','

" Searching
set nohlsearch  " Do not highlight search results
set ignorecase  " Ignore case

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
set splitbelow splitright

" Set command completion
set wildmode=list:longest,full
set wildignorecase

" Always show statusline
set laststatus=2

" Set width for line numbers
set numberwidth=8

" Relative Numbers
set number relativenumber

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" No wrap by default
" I enable it for certain filetypes
set nowrap

" Fold
set foldenable
set foldmethod=marker
set foldlevel=99

" Clipboard support
set clipboard+=unnamedplus

" Write to undo file
set undofile

" Default shell to use
set shell=/usr/bin/env\ zsh

" Use mouse for all modes
set mouse=a

" Show split preview for some commands
set inccommand=split

" Insert two spaces after a period with every joining of lines.
set joinspaces

" Give me a prompt instead of just rejecting risky :write, :saveas
set confirm

" Treat underscore as a word break
set iskeyword-=_

" guifont
set guifont=Iosevka:h15

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
set statusline+=\        " Leave empty space

" Mappings: {{{

" Life changer
noremap <space> :

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Readline style keybindings in Insert Mode
imap <C-a> <Home>
imap <C-f> <right>
imap <C-b> <left>
imap <C-e> <End>

" Toggle spell check
nnoremap <leader>o :setlocal spell!<CR>
" Edit the neovim config file
nnoremap <leader>v :e ~/.config/nvim/init.vim<CR>
" Toggle Highlighted search
nnoremap <leader>s :setlocal hls!<CR>
" Copy all file content to clipboard
nnoremap <leader>c :!pbcopy < %<CR>

" Escape terminal easily
tnoremap <Esc> <C-\><C-n>

" Mappings for quicklist navigation
nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>
nnoremap [Q :cfirst<CR>
nnoremap ]Q :clast<CR>

" Open Help on the side
cnoreabbrev help vert help

let @q = 'dt:$a (p0xxj'

" }}}

" Load lua config
lua require('init')
