" Set text files settings
function text#WritingSettings()
  " Enable wrap and linebreak
  setlocal wrap linebreak
  " Set text width
  setlocal textwidth=80
  " Correct mistakes with C-l in Insert Mode
  inoremap <buffer> <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
endfunction

