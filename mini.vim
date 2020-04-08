" MINI VIM:
" =========

" A minimalistic Vim configuration
" No plugins are used
" Ideal for remote servers

" No vi compatible mode
set nocompatible

" Enable syntax
syntax on

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

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Clipboard
set clipboard=unnamedplus

" Fold
set foldenable
set foldmethod=marker
set foldlevel=99

" Disables automatic commenting on newline
autocmd FileType * setlocal formatoptions-=cro

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Readline style keybindings in Insert Mode (I don't like arrow keys)
imap <C-a> <Home>
imap <C-e> <End>

" Toggle Highlighted search
nnoremap <leader>s :setlocal hls!<CR>

" Display statusline
set laststatus=2

" Status line Content
let g:currentmode={
      \ 'n'  : 'NORMAL ',
      \ 'v'  : 'VISUAL ',
      \ 'V'  : 'V·LINE ',
      \ '' : 'V·BLOCK ',
      \ 'i'  : 'INSERT ',
      \ 'ic' : 'INSERT COMPL',
      \ 'ix' : 'INSERT COMPL',
      \ 'R'  : 'REPLACE ',
      \ 'Rv' : 'V·REPLACE ',
      \ 'c'  : 'COMMAND ',
      \ 't'  : 'TERMINAL',
      \}

set statusline=
set statusline+=\ %{g:currentmode[mode()]}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m
set statusline+=%=
set statusline+=\%y
set statusline+=\ %#CursorColumn#
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %#StatusLine#
set statusline+=\%4p%%
set statusline+=\%4l:%-4c

