"              _                    
"       __   _(_)_ __ ___  _ __ ___ 
"       \ \ / / | '_ ` _ \| '__/ __|
"        \ V /| | | | | | | | | (__ 
"       (_)_/ |_|_| |_| |_|_|  \___|
                            
" ==========================================
" Editor Options: {{{
" ==========================================

" Enable syntax
syntax on

" Colorscheme
" For some reason this is the only way to make Dracula not freakout
packadd! dracula
colorscheme dracula
set background=dark
highlight Normal ctermbg=None

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

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

" " Change fold colors
" hi Folded ctermfg=Blue
" hi Folded ctermbg=DarkGrey
" 
" " Change color for spelling
" hi SpellBad ctermbg=Blue
" hi SpellBad ctermfg=White
" hi SpellRare ctermbg=Magenta
" hi SpellRare ctermbg=White
" 
" " Change SignColumn to no color
" hi SignColumn ctermbg=none

" Netrw tree style
let g:netrw_liststyle = 3

" Don't show status line
set laststatus=1

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
nnoremap <leader>n :Ntree<CR>

" Disables automatic commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Enable line break and wrap for certain buffers
autocmd FileType markdown setlocal wrap linebreak
autocmd FileType tex setlocal wrap linebreak

" Toggle spell check
map <leader>o :setlocal spell!<CR>

" Edit the neovim config file
nnoremap <leader>v :e ~/.config/nvim/init.vim<CR>

" Delete trailing white spaces
autocmd FileType yaml autocmd BufWritePre <buffer> %s/\s\+$//e

" Comments created by self written functions
command! ToggleSignColumns call <SID>ToggleSignColumns()
command! LatexClean call <SID>LatexClean()
command! MdLiveCompile call <SID>MdLiveCompile()

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

" Call the latex-clean script to remove confg files
function! s:LatexClean()
  if !executable("latex-clean")
    echoerr "The script latex-clean can't be found"
  endif
  silent !latex-clean
endfunction

" Live compile current markdown file
function! s:MdLiveCompile()
  if !executable("grip")
    echoerr "The script grip can't be found"
  elseif &ft == 'markdown'
    !grip % --browser --quiet
  else
    echoerr "This is not a markdown file"
  endif
endfunction

" }}}
" ==========================================
" Golang: {{{
" ==========================================
if isdirectory($HOME . "/.config/nvim/pack/plugins/start/vim-go/")
  " format with goimports instead of gofmt
  let g:go_fmt_command = "goimports"

  " Add more colors
  let g:go_highlight_types = 1
  let g:go_highlight_fields = 1
  let g:go_highlight_functions = 1
  let g:go_highlight_function_calls = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_extra_types = 1
endif

" }}}
" ==========================================
" LaTeX: {{{
" ==========================================

if isdirectory($HOME . "/.config/nvim/pack/plugins/start/vimtex")
  let g:tex_flavor='latex'
  let g:vimtex_view_method='general'
  let g:vimtex_quickfix_mode=0
  set conceallevel=1
  let g:tex_conceal='abdmg'
endif

" }}}
" ==========================================
" COC: {{{
" ==========================================

if isdirectory($HOME . "/.config/nvim/pack/plugins/start/coc.nvim")
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
endif

" }}}
" ==========================================
