set background=light

" Remove all existing highlighting and set the defaults.
highlight clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

set notermguicolors

let colors_name = "default"

" Change some highlights for convenience
highlight clear VertSplit
