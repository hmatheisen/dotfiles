" Far Better: {{{
"" This is a shameless copy/paste of dracula theme, available here:
" https://github.com/zenorocha/dracula-theme
"
" I like Dracula theme but I always wanted to make some changes so this is now
" the 'far better' theme
"
" }}}

" Configuration: {{{

if v:version > 580
  highlight clear
  if exists('syntax_on')
    syntax reset
  endif
endif

let g:colors_name = 'far-better'

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif

" Palette: {{{2

let s:fg        = ['#F8F8F2', 253]

let s:bglighter = ['#424450', 238]
let s:bglight   = ['#343746', 237]
let s:bg        = ['#000000',   0]
let s:bgdark    = ['#21222C', 235]
let s:bgdarker  = ['#191A21', 234]

let s:comment   = ['#6272A4',  61]
let s:selection = ['#44475A', 239]
let s:subtle    = ['#424450', 238]

let s:cyan      = ['#8BE9FD', 117]
let s:green     = ['#50FA7B',  84]
let s:orange    = ['#FFB86C', 215]
let s:pink      = ['#FF79C6', 212]
let s:purple    = ['#BD93F9', 141]
let s:red       = ['#FF5555', 203]
let s:yellow    = ['#F1FA8C', 228]

let s:none      = ['NONE', 'NONE']

" }}}2
" User Configuration: {{{2

" Nothing yet

"}}}2
" Script Helpers: {{{2

let s:attrs = {
      \ 'bold': 'bold',
      \ 'italic': 'italic',
      \ 'underline': 'underline',
      \ 'undercurl': 'undercurl',
      \ 'inverse': 'inverse',
      \}

function! s:h(scope, fg, ...) " bg, attr_list, special
  let l:fg = copy(a:fg)
  let l:bg = get(a:, 1, ['NONE', 'NONE'])

  let l:attr_list = filter(get(a:, 2, ['NONE']), 'type(v:val) == 1')
  let l:attrs = len(l:attr_list) > 0 ? join(l:attr_list, ',') : 'NONE'

  " Falls back to coloring foreground group on terminals because
  " nearly all do not support undercurl
  let l:special = get(a:, 3, ['NONE', 'NONE'])
  if l:special[0] !=# 'NONE' && l:fg[0] ==# 'NONE' && !has('gui_running')
    let l:fg[0] = l:special[0]
    let l:fg[1] = l:special[1]
  endif

  let l:hl_string = [
        \ 'highlight', a:scope,
        \ 'guifg=' . l:fg[0], 'ctermfg=' . l:fg[1],
        \ 'guibg=' . l:bg[0], 'ctermbg=' . l:bg[1],
        \ 'gui=' . l:attrs, 'cterm=' . l:attrs,
        \ 'guisp=' . l:special[0],
        \]

  execute join(l:hl_string, ' ')
endfunction

"}}}2
" FarBetter Highlight Groups: {{{2

call s:h('FarBetterBgLight', s:none, s:bglight)
call s:h('FarBetterBgLighter', s:none, s:bglighter)
call s:h('FarBetterBgDark', s:none, s:bgdark)
call s:h('FarBetterBgDarker', s:none, s:bgdarker)

call s:h('FarBetterFg', s:fg)
call s:h('FarBetterFgUnderline', s:fg, s:none, [s:attrs.underline])
call s:h('FarBetterFgBold', s:fg, s:none, [s:attrs.bold])

call s:h('FarBetterComment', s:comment)
call s:h('FarBetterCommentBold', s:comment, s:none, [s:attrs.bold])

call s:h('FarBetterSelection', s:none, s:selection)

call s:h('FarBetterSubtle', s:subtle)

call s:h('FarBetterCyan', s:cyan)
call s:h('FarBetterCyanItalic', s:cyan, s:none, [s:attrs.italic])

call s:h('FarBetterGreen', s:green)
call s:h('FarBetterGreenBold', s:green, s:none, [s:attrs.bold])
call s:h('FarBetterGreenItalic', s:green, s:none, [s:attrs.italic])
call s:h('FarBetterGreenItalicUnderline', s:green, s:none, [s:attrs.italic, s:attrs.underline])

call s:h('FarBetterOrange', s:orange)
call s:h('FarBetterOrangeBold', s:orange, s:none, [s:attrs.bold])
call s:h('FarBetterOrangeItalic', s:orange, s:none, [s:attrs.italic])
call s:h('FarBetterOrangeBoldItalic', s:orange, s:none, [s:attrs.bold, s:attrs.italic])
call s:h('FarBetterOrangeInverse', s:bg, s:orange)

call s:h('FarBetterPink', s:pink)
call s:h('FarBetterPinkItalic', s:pink, s:none, [s:attrs.italic])

call s:h('FarBetterPurple', s:purple)
call s:h('FarBetterPurpleBold', s:purple, s:none, [s:attrs.bold])
call s:h('FarBetterPurpleItalic', s:purple, s:none, [s:attrs.italic])

call s:h('FarBetterRed', s:red)
call s:h('FarBetterRedInverse', s:fg, s:red)

call s:h('FarBetterYellow', s:yellow)
call s:h('FarBetterYellowItalic', s:yellow, s:none, [s:attrs.italic])

call s:h('FarBetterError', s:red, s:none, [], s:red)

call s:h('FarBetterErrorLine', s:none, s:none, [s:attrs.undercurl], s:red)
call s:h('FarBetterWarnLine', s:none, s:none, [s:attrs.undercurl], s:orange)
call s:h('FarBetterInfoLine', s:none, s:none, [s:attrs.undercurl], s:cyan)

call s:h('FarBetterTodo', s:cyan, s:none, [s:attrs.bold, s:attrs.inverse])
call s:h('FarBetterSearch', s:green, s:none, [s:attrs.inverse])
call s:h('FarBetterBoundary', s:comment, s:bgdark)
call s:h('FarBetterLink', s:cyan, s:none, [s:attrs.underline])

call s:h('FarBetterDiffChange', s:orange, s:none)
call s:h('FarBetterDiffText', s:bg, s:orange)
call s:h('FarBetterDiffDelete', s:red, s:bgdark)

" }}}2

" }}}
" User Interface: {{{

set background=dark

" Required as some plugins will overwrite
call s:h('Normal', s:fg, s:bg)
call s:h('StatusLine', s:none, s:none, [s:attrs.bold])
call s:h('StatusLineNC', s:subtle, s:none)
call s:h('StatusLineTerm', s:none, s:bglighter, [s:attrs.bold])
call s:h('StatusLineTermNC', s:none, s:bglight)
call s:h('WildMenu', s:bg, s:purple, [s:attrs.bold])
call s:h('CursorLine', s:none, s:subtle)

hi! link ColorColumn  FarBetterBgDark
hi! link CursorColumn CursorLine
hi! link CursorLineNr FarBetterYellow
hi! link DiffAdd      FarBetterGreen
hi! link DiffAdded    DiffAdd
hi! link DiffChange   FarBetterDiffChange
hi! link DiffDelete   FarBetterDiffDelete
hi! link DiffRemoved  DiffDelete
hi! link DiffText     FarBetterDiffText
hi! link Directory    FarBetterPurpleBold
hi! link ErrorMsg     FarBetterRedInverse
hi! link FoldColumn   FarBetterSubtle
hi! link Folded       FarBetterBoundary
hi! link IncSearch    FarBetterOrangeInverse
call s:h('LineNr', s:comment)
hi! link MoreMsg      FarBetterFgBold
hi! link NonText      FarBetterSubtle
hi! link Pmenu        FarBetterBgDark
hi! link PmenuSbar    FarBetterBgDark
hi! link PmenuSel     FarBetterSelection
hi! link PmenuThumb   FarBetterSelection
hi! link Question     FarBetterFgBold
hi! link Search       FarBetterSearch
call s:h('SignColumn', s:comment)
hi! link TabLine      FarBetterBoundary
hi! link TabLineFill  FarBetterBgDarker
hi! link TabLineSel   Normal
hi! link Title        FarBetterGreenBold
hi! link VertSplit    FarBetterBoundary
hi! link Visual       FarBetterSelection
hi! link VisualNOS    Visual
hi! link WarningMsg   FarBetterOrangeInverse

" }}}
" Syntax: {{{

" Required as some plugins will overwrite
call s:h('MatchParen', s:green, s:none, [s:attrs.underline])
call s:h('Conceal', s:cyan, s:none)

" Neovim uses SpecialKey for escape characters only. Vim uses it for that, plus whitespace.
if has('nvim')
  hi! link SpecialKey FarBetterRed
  hi! link LspDiagnosticsUnderline FarBetterFgUnderline
  hi! link LspDiagnosticsInformation FarBetterCyan
  hi! link LspDiagnosticsHint FarBetterCyan
  hi! link LspDiagnosticsError FarBetterError
  hi! link LspDiagnosticsWarning FarBetterOrange
  hi! link LspDiagnosticsUnderlineError FarBetterErrorLine
  hi! link LspDiagnosticsUnderlineHint FarBetterInfoLine
  hi! link LspDiagnosticsUnderlineInformation FarBetterInfoLine
  hi! link LspDiagnosticsUnderlineWarning FarBetterWarnLine
else
  hi! link SpecialKey FarBetterSubtle
endif

hi! link Comment FarBetterComment
hi! link Underlined FarBetterFgUnderline
hi! link Todo FarBetterTodo

hi! link Error FarBetterError
hi! link SpellBad FarBetterErrorLine
hi! link SpellLocal FarBetterWarnLine
hi! link SpellCap FarBetterInfoLine
hi! link SpellRare FarBetterInfoLine

hi! link Constant FarBetterPurple
hi! link String FarBetterYellow
hi! link Character FarBetterPink
hi! link Number Constant
hi! link Boolean Constant
hi! link Float Constant

hi! link Identifier FarBetterFg
hi! link Function FarBetterGreen

hi! link Statement FarBetterPink
hi! link Conditional FarBetterPink
hi! link Repeat FarBetterPink
hi! link Label FarBetterPink
hi! link Operator FarBetterPink
hi! link Keyword FarBetterPink
hi! link Exception FarBetterPink

hi! link PreProc FarBetterPink
hi! link Include FarBetterPink
hi! link Define FarBetterPink
hi! link Macro FarBetterPink
hi! link PreCondit FarBetterPink
hi! link StorageClass FarBetterPink
hi! link Structure FarBetterPink
hi! link Typedef FarBetterPink

hi! link Type FarBetterCyanItalic

hi! link Delimiter FarBetterFg

hi! link Special FarBetterPink
hi! link SpecialComment FarBetterCyanItalic
hi! link Tag FarBetterCyan
hi! link helpHyperTextJump FarBetterLink
hi! link helpCommand FarBetterPurple
hi! link helpExample FarBetterGreen
hi! link helpBacktick Special

"}}}

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=1 et:
