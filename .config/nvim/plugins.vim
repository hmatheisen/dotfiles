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
Plug 'ayu-theme/ayu-vim'
Plug 'vim-airline/vim-airline-themes'

" Language specific
Plug 'fatih/vim-go'
Plug 'lervag/vimtex'
Plug 'hashivim/vim-terraform'
Plug 'chemzqm/vim-jsx-improve'
Plug 'cespare/vim-toml'
Plug 'tpope/vim-fireplace'

call plug#end()


" }}}
" ==========================================
" Colorscheme: {{{
" ==========================================

set termguicolors
set background=dark
let ayucolor="dark"
let g:gruvbox_contrast_dark='hard'
let g:jellybeans_use_term_italics = 1
colorscheme jellybeans

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

" Toggle command
nnoremap <leader>f :NERDTreeToggle<CR>

" }}}
" ==========================================
" ALE: {{{
" ==========================================

" Manage linters
let g:ale_linters = {
      \'javascript': ['eslint'],
      \'typescript': ['eslint'],
      \}

" Manage fixers
let g:ale_fixers = {
      \'*': ['trim_whitespace'],
      \'javascript': ['eslint'],
      \'typescript': ['eslint']
      \}

" Fix file on save
let g:ale_fix_on_save = 1

" }}}
" ==========================================
" IndentLines: {{{
" ==========================================

" Indent guide disable by default
let g:indentLine_enabled = 0
nnoremap <leader>i :IndentLinesToggle<CR>

" }}}
" ==========================================
" Vimtex: {{{
" ==========================================

" Specify tex flavor
let g:tex_flavor = 'latex'

" }}}
" ==========================================
" Terraform:
" ==========================================

let g:terraform_align=1
let g:terraform_fmt_on_save=1

" }}}
" ==========================================
