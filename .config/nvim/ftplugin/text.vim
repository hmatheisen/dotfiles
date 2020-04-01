" Enable wrap and linebreak
setlocal wrap linebreak

" Set text width
setlocal textwidth=90

" Enable spell check
setlocal spell

" Correct mistakes with C-l in Insert Mode
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

