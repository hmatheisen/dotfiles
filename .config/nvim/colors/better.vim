" Vim color file

highlight clear
if exists("syntax_on")
  syntax reset
end

set background=dark
let g:colors_name="better"

" Colors:
" Black
" DarkBlue
" DarkGreen
" DarkCyan
" DarkRed
" DarkMagenta
" Brown, DarkYellow
" LightGray, LightGrey, Gray, Grey
" DarkGray, DarkGrey
" Blue, LightBlue
" Green, LightGreen
" Cyan, LightCyan
" Red, LightRed
" Magenta, LightMagenta
" Yellow, LightYellow
" White

hi Comment ctermfg=DarkGray

hi Constant ctermfg=Blue
" hi String
" hi Character
" hi Number
" hi Boolean
" hi Float

hi Identifier ctermfg=Magenta
" hi Function

hi Statement ctermfg=DarkMagenta
" hi Conditional
" hi Repeat
" hi Label
" hi Operator
" hi Keyword
" hi Exception

hi PreProc cterm=bold ctermfg=LightBlue
" hi Include
" hi Define
" hi Macro
" hi PreCondit

hi Type ctermfg=Magenta
" hi StorageClass
" hi Structure
" hi Typedef

hi Special ctermfg=LightMagenta
" hi SpecialChar
" hi Tag
" hi Delimiter
" hi SpecialComment
" hi Debug

" hi Underlined

" hi Ignore

" hi Error

" hi Todo

" hi ColorColumn
" hi Conceal
" hi Cursor
" hi CursorIM
" hi CursorColumn
" hi CursorLine
" hi Directory
" hi DiffAdd
" hi DiffChange
" hi DiffDelete
" hi DiffText
" hi EndOfBuffer
" hi TermCursor
" hi TermCursorNC
" hi ErrorMsg
hi VertSplit cterm=NONE ctermfg=DarkGrey
hi Folded ctermbg=DarkGrey ctermfg=LightMagenta
" hi FoldColumn
" hi SignColumn
" hi IncSearch
" hi Substitute
hi LineNr ctermfg=Grey
hi CursorLineNr ctermfg=DarkMagenta
" hi MatchParen
" hi ModeMsg
" hi MsgArea
" hi MsgSeparator
" hi MoreMsg
" hi NonText
hi Normal ctermfg=White ctermbg=NONE cterm=NONE
" hi NormalFloat
" hi NormalNC
hi Pmenu cterm=NONE ctermfg=White ctermbg=DarkGray
hi PmenuSel cterm=bold ctermfg=Black ctermbg=LightGrey
" hi PmenuSbar
" hi PmenuThumb
" hi Question
" hi QuickFixLine
" hi Search
" hi SpecialKey
" hi SpellBad
" hi SpellCap
" hi SpellLocal
" hi SpellRare
hi StatusLine cterm=bold
hi StatusLineNC cterm=NONE ctermfg=DarkGrey
" hi TabLine
" hi TabLineFill
" hi TabLineSel
" hi Title
hi Visual cterm=reverse ctermbg=NONE
" hi VisualNOS
" hi WarningMsg
" hi Whitespace
hi WildMenu cterm=bold ctermfg=Black ctermbg=LightMagenta


" vim:tw=80
