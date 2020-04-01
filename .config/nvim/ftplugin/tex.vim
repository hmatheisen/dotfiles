" Vimtex settings
let g:tex_flavor='latex'
let g:vimtex_view_method='general'
let g:vimtex_quickfix_mode=0
let g:tex_conceal='abdmg'
set conceallevel=1

" Enable wrap and linebreak
setlocal wrap linebreak

" Set text width
setlocal textwidth=90

" Enable spell check
setlocal spell

" Correct mistakes with C-l in Insert Mode
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

