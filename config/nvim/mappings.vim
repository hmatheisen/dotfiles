" ==========================================
" Commands: {{{
" ==========================================

" Disables automatic commenting on newline
autocmd FileType * setlocal formatoptions-=cro

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Readline style keybindings in Insert Mode (I don't like arrow keys)
imap <C-a> <Home>
imap <C-f> <right>
imap <C-b> <left>
imap <C-e> <End>

" Toggle spell check
nnoremap <leader>o :setlocal spell!<CR>

" Edit the neovim config file
nnoremap <leader>v :e ~/.config/nvim<CR>

" Toggle Highlighted search
nnoremap <leader>s :setlocal hls!<CR>

" Copy all file content to clipboard
nnoremap <leader>c :!pbcopy < %<CR>

" Escape terminal easily
tnoremap <Esc> <C-\><C-n>

" Easy switch buffers
" map gn :bn<cr>
" map gp :bp<cr>

" Personal autoclose
inoremap {        {}<Left>
inoremap (        ()<Left>
inoremap (<Space> ()<Space>
inoremap [        []<Left>
inoremap '        ''<Left>
inoremap "        ""<Left>

" }}}
" ==========================================

