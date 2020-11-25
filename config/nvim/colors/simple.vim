" A simple vim colorscheme based on the defaut theme.
" Only minor changes like statusline.

" Configuration: {{{

if v:version > 580
  highlight clear
  if exists('syntax_on')
    syntax reset
  endif
endif

let g:colors_name = 'simple'

" }}}

" Colors: {{{

set background=light

" No highlight on status line
hi StatusLine NONE
" Dim colors on status line NC
hi! link StatusLineNC Conceal
" No background color in vertical split line
hi VertSplit NONE

" }}}
