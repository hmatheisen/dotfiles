" Save cursor pos and strip trailing whitespaces
function StripTrailingWhitespaces()
  let save_cursor = getpos(".")
  %s/\s\+$//e
  call setpos('.', save_cursor)
endfun

" Show all trailing whitespaces
function ShowSpaces()
  let &hlsearch=1
  let @/='\v(\s+$)|( +\ze\t)'
endfunction

autocmd BufWritePre * call StripTrailingWhitespaces()

command ShowSpaces call ShowSpaces()
nnoremap <F12> :ShowSpaces<CR>
