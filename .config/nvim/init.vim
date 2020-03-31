"              _
"       __   _(_)_ __ ___  _ __ ___
"       \ \ / / | '_ ` _ \| '__/ __|
"        \ V /| | | | | | | | | (__
"       (_)_/ |_|_| |_| |_|_|  \___|

" ==========================================
" Vim Plug: {{{
" ==========================================

call plug#begin('~/.vim/plugged')

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Editor enhancements:
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Raimondi/delimitMate'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-commentary'

" Looks
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'
Plug 'vim-airline/vim-airline-themes'

" Language specific
Plug 'fatih/vim-go'
Plug 'lervag/vimtex'
Plug 'hashivim/vim-terraform'
Plug 'chemzqm/vim-jsx-improve'

call plug#end()

" }}}
" ==========================================
" Editor Options: {{{
" ==========================================

" Enable syntax
syntax on

" Colorscheme
set termguicolors
set background=dark
colorscheme jellybeans

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

" }}}
" ==========================================
" Commands: {{{
" ==========================================

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Correct mistakes with C-l in Insert Mode
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" Readline style keybindings in Insert Mode (I don't like arrow keys)
imap <C-a> <Home>
imap <C-e> <End>

" Disables automatic commenting on newline
autocmd FileType * setlocal formatoptions-=cro

" Toggle spell check
map <leader>o :setlocal spell!<CR>

" Edit the neovim config file
nnoremap <leader>v :e ~/.config/nvim/init.vim<CR>

" Commands created by self written functions
command! ToggleSignColumns call functions#ToggleSignColumns()

" NERDTree toggle command
nnoremap <leader>f :NERDTreeToggle<CR>

" Escape terminal easily
tnoremap <Esc> <C-\><C-n>

" Easy switch buffers
map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>

" Toggle Highlighted search
nnoremap <leader>s :setlocal hls!<CR>

" Indent guide disable by default
let g:indentLine_enabled = 0
nnoremap <leader>i :IndentLinesToggle<CR>

" }}}
" ==========================================
" COC: {{{
" ==========================================

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" Use <Tab> and <S-Tab> to navigate the completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use <cr> to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" To make <cr> select the first completion item and confirm the completion when no item has been selected
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" To make coc.nvim format your code on <cr>, use keymap
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Close the preview window when completion is done
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" }}}
" ==========================================
" NERDTree: {{{
" ==========================================

" Show hidden files by default
let NERDTreeShowHidden=1
" Exclude certainf files
let NERDTreeIgnore = ['\.git$', '.swp']
" Enter NERDTree when opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" Disable help text
let NERDTreeMinimalUI = 1

" }}}
" ==========================================
" ALE: {{{
" ==========================================

" Manage linters
let g:ale_linters = {
      \'javascript': ['eslint'],
      \'typescript': ['tslint'],
      \}

" Manage fixers
let g:ale_fixers = {
      \'*': ['trim_whitespace'],
      \'javascript': ['eslint'],
      \'typescript': ['tslint']
      \}

" Fix file on save
let g:ale_fix_on_save = 1

" }}}
" ==========================================
