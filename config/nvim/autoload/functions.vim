" Set text files settings
function functions#TextSettings()
  " Enable wrap and linebreak
  setlocal wrap linebreak
  " Set text width
  setlocal textwidth=90
  " Enable spell check
  setlocal spell
  " Correct mistakes with C-l in Insert Mode
  inoremap <buffer> <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
endfunction
