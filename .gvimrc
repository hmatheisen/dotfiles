" Change font
set macligatures
set guifont=JetBrains\ Mono:h13

" Disable scroll bars
set guioptions=

set go+=c

" Disable title
set notitle
set titlestring=

" Set Theme
set termguicolors
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='soft'
colorscheme gruvbox

" Fix env variable not being loaded
let $TEXINPUTS=".:$HOME/Documents/tex/classes:"

