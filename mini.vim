"                  _       _         _
"        _ __ ___ (_)_ __ (_) __   _(_)_ __ ___  _ __ ___
"       | '_ ` _ \| | '_ \| | \ \ / / | '_ ` _ \| '__/ __|
"       | | | | | | | | | | |  \ V /| | | | | | | | | (__
"       |_| |_| |_|_|_| |_|_| (_)_/ |_|_| |_| |_|_|  \___|

" ==========================================
" Editor Options: {{{
" ==========================================

" Enable syntax
syntax on

" Set background light because the theme looks better
set background=light

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set ttyfast

" Fix backspace indent
set backspace=indent,eol,start

" Tabs. May be overridden by autocmd rules
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Map leader to ,
let mapleader=','

" Enable hidden buffers
set hidden

" Searching
set nohlsearch
set incsearch
set ignorecase
set wildignorecase

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults. (Copyrights LukeSmithxyz)
set splitbelow splitright

" Set command completion
set wildmode=list:longest,full
set wildmenu

" Relative Numbers
set nu rnu

" No Word Wrap
set nowrap

" Set spell lang
set spelllang=fr,en_gb

" Set Shell
set shell=/usr/local/bin/bash

" Set swap directory
set directory^=$HOME/.vim/tmp//

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Fold
set foldenable
set foldmethod=marker
set foldlevel=99

" Enable markdown fold
let g:markdown_folding = 1

" Change cursor shape depending on the mode
let &t_SI = "\<esc>[5 q"
let &t_SR = "\<esc>[3 q"
let &t_EI = "\<esc>[2 q"

" Change fold colors
hi Folded ctermfg=Blue
hi Folded ctermbg=DarkGrey

" Change color for spelling
hi SpellBad ctermbg=Blue
hi SpellRare ctermbg=Magenta

" Netrw config
let g:netrw_liststyle = 3

" }}}
" ==========================================
" Commands: {{{
" ==========================================

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Correct mistakes with C-l
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" Readline style keybindings in Insert Mode (I don't like arrow keys)
imap <C-b> <Left>
imap <C-f> <Right>
imap <C-a> <Home>
imap <C-e> <End>
imap <C-p> <Up>
imap <C-n> <Down>

" Use Netrw to view project structure
nnoremap <C-n> :Ntree<CR>

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Enable line break and wrap for certain buffers
autocmd FileType markdown setlocal wrap linebreak
autocmd FileType tex setlocal wrap linebreak

" Spell check active by default for certain buffers
autocmd FileType markdown setlocal spell
autocmd FileType tex setlocal spell

" Toggle spellcheck
map <leader>o :setlocal spell!<CR>

" Clear compilation files when leaving tex file
autocmd VimLeave tex silent !latex-clean

" }}}
" ==========================================
" Functions: {{{
" ==========================================

" Toggle the sign column
function! s:ToggleSignColumns()
  if !exists("b:signcolumn_on") || b:signcolumn_on
    set signcolumn=no
    let b:signcolumn_on=0
  else
    set signcolumn=auto
    let b:signcolumn_on=1
  endif
endfunction

command! ToggleSignColumns call <SID>ToggleSignColumns()

" Call the latex-clean script to remove confg files
function! s:LatexClean()
  if !executable("latex-clean")
    echoerr "The script latex-clean can't be found"
  endif
  silent !latex-clean
endfunction

" I create a command for it although I do call it when vim leaves a tex file
command! LatexClean call <SID>LatexClean()

" }}}
" ==========================================
