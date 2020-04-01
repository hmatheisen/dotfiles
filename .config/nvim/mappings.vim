" ==========================================
" Commands: {{{
" ==========================================
" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Readline style keybindings in Insert Mode (I don't like arrow keys)
imap <C-a> <Home>
imap <C-e> <End>

" Disables automatic commenting on newline
autocmd FileType * setlocal formatoptions-=cro

" Toggle spell check
map <leader>o :setlocal spell!<CR>

" Edit the neovim config file
nnoremap <leader>v :e ~/.config/nvim/init.vim<CR>

" Toggle the sign column
command! ToggleSignColumns call ToggleSignColumns()

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

