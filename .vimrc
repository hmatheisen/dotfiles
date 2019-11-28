" ==========================================
" VimPlug: {{{
" ==========================================

let vimplug_exists=expand('~/.vim/autoload/plug.vim')

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!\curl -fLo " . vimplug_exists . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

" }}}
" ==========================================
" Plugins: {{{
" ==========================================

call plug#begin('~/.vim/plugged')

" Theme
Plug 'morhetz/gruvbox'

" tpope's sweet stuff
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'

" Editor enhancements
Plug 'raimondi/delimitMate'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Languages / Frameworks

" Golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" LaTeX
Plug 'lervag/vimtex'

call plug#end()

" }}}
" ==========================================
" Editor Options: {{{
" ==========================================

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

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults. (Copyright LukeSmithxyz)
set splitbelow splitright

" Set command completion
set wildmode=list:longest,full

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Relative Numbers
set nu rnu

" No Word Wrap
set nowrap

" Except of certain files
autocmd FileType markdown setlocal wrap linebreak
autocmd FileType tex setlocal wrap linebreak

" Set spell lang
set spelllang=fr,en_gb

" Spell check for certain buffers
autocmd FileType markdown setlocal spell
autocmd FileType tex setlocal spell

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

" }}}
" ==========================================
" Commands: {{{
" ==========================================

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Map C-p to fzf :Files
map <C-p> :Files<CR>

" Correct mistakes with C-l
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" Readline style keybindings in Insert Mode (I don't like arrow keys)
imap <C-b> <Left>
imap <C-f> <Right>
imap <C-a> <Home>
imap <C-e> <End>
imap <C-p> <Up>
imap <C-n> <Down>

" }}}
" ==========================================
" Theme Configuration: {{{
" ==========================================

set termguicolors
let g:gruvbox_contrast_dark='hard'
set background=dark
silent colorscheme gruvbox

" }}}
" ==========================================
" ALE: {{{
" ==========================================

" Manage linters
let g:ale_linters = {
      \   'javascript': ['eslint'],
      \   'typescript': ['tsserver', 'tslint'],
      \}

" Manage fixers
let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'javascript': ['eslint'],
      \   'typescript': ['tslint']
      \}

" Fix file on save
let g:ale_fix_on_save = 1

" }}}
" ==========================================
" NERD Tree: {{{
" ==========================================

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

map <C-n> :NERDTreeToggle<CR>

let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.git$']

" }}}
" ==========================================
" Golang: {{{
" ==========================================

" format with goimports instead of gofmt
let g:go_fmt_command = "goimports"

" Add more colors
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1

" }}}
" ==========================================
" LaTeX: {{{
" ==========================================

let g:tex_flavor='latex'
let g:vimtex_view_method='general'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" }}}
" ==========================================
" COC: {{{
"===========================================

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-s> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o :<C-u>CocList outline<cr>
" Search workspace symbol
nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p :<C-u>CocListResume<CR>

" }}}
" ==========================================
" Functions: {{{
" ==========================================

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

function! s:LatexClean()
  if !executable("latex-clean")
    echoerr "The script latex-clean can't be found"
  endif
  silent !latex-clean
endfunction

command! LatexClean call <SID>LatexClean()

" }}}
" ==========================================
