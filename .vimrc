" ******************************************
" VimPlug:
" ******************************************

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

" ******************************************
" Plugins:
" ******************************************
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-rails'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'raimondi/delimitmate'

" Golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Typescript
Plug 'leafgarland/typescript-vim'

call plug#end()

" ******************************************
" Theme Configuration:
" ******************************************

let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox
let g:gruvbox_italic = 1
let background='dark'

" ******************************************
" Airline:
" ******************************************

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

" ******************************************
" NERD Tree:
" ******************************************

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

map <C-n> :NERDTreeToggle<CR>

let NERDTreeShowHidden=1

" ******************************************
" Editor Options:
" ******************************************

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set ttyfast

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overridden by autocmd rules
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

"" Map leader to ,
let mapleader=','

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults. (Copyright LukeSmithxyz)
set splitbelow splitright

" Set command completion
set wildmode=list:longest,full

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Trim whitespace
command! FixWhitespace :%s/\s\+$//e

" Relative Numbers
set nu rnu

