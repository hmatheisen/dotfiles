" Live compile current markdown file
function! s:MdLiveCompile()
  if !executable("grip")
    echoerr "The script grip can't be found"
  elseif &ft == 'markdown'
    !grip % --browser --quiet
  else
    echoerr "This is not a markdown file"
  endif
endfunction

command! MdLiveCompile call <SID>MdLiveCompile()

" Enable markdown fold
let g:markdown_folding = 1

" Set line break and wrap
setlocal wrap linebreak

" Set text width
setlocal textwidth=90

" Enable spell check
setlocal spell
