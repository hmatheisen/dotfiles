" Set grepprg as ripgrep
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case

" Create silent version of grep
command -nargs=* Grep :silent grep <args>

" Create abbrev :grep => :Grep
cnoreabbrev <expr> grep (getcmdtype() ==# ':' && getcmdline() ==# 'grep') ? 'Grep' : 'grep'

" Open Quickfix window automatically after command
augroup quickfix
  autocmd!
  autocmd QuickFixCmdPost [^l]* cwindow
  autocmd QuickFixCmdPost l* lwindow
augroup END
