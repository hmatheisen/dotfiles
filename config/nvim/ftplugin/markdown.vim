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

" Text settings
call functions#TextSettings()
