" Vim color file
" Maintainer:	Agnaldo Junior <agnaldo.junior01@gmail.com>
" Last Change:	2022 May 4
" Version:	1.0.1
" URL:		https://github.com/agnjunio/dotfiles
"
" These are the colors of the "Ag1" theme by inspired by "OceanBlack"
" by Chris Vertonghen modified to work on 256-color xterms.
"
set background=dark

hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "ag1"

" gui is for GVim
" cterm is for terminal

hi Normal         gui=none            ctermfg=7		ctermbg=None
hi NonText        gui=none            ctermfg=117	ctermbg=None

hi Visual         gui=reverse         ctermfg=72	ctermbg=15
hi VisualNOS      gui=bold,underline  ctermfg=151	ctermbg=None

hi Cursor         gui=none            ctermfg=15	ctermbg=152
hi CursorIM       gui=bold            ctermfg=15	ctermbg=152
"hi CursorColumn
"hi CursorLine


hi Directory                          ctermfg=5		ctermbg=None

hi DiffAdd        gui=none            ctermfg=15	ctermbg=22
hi DiffChange     gui=none            ctermfg=207	ctermbg=90
hi DiffDelete     gui=none            ctermfg=19	ctermbg=17
hi DiffText       gui=bold            ctermfg=226	ctermbg=90

hi Question       gui=bold            ctermfg=85	ctermbg=None
hi ErrorMsg                           ctermfg=230	ctermbg=167
hi ModeMsg                            ctermfg=77	ctermbg=22
hi MoreMsg        gui=bold            ctermfg=72	ctermbg=None
hi WarningMsg     gui=bold            ctermfg=203	ctermbg=None

hi LineNr                             ctermfg=243	ctermbg=233
hi Folded         gui=none            ctermfg=152	ctermbg=66
hi FoldColumn     gui=none            ctermfg=152	ctermbg=66
"hi SignColumn

hi Search         gui=none            ctermfg=16	ctermbg=66
hi IncSearch      gui=reverse         ctermfg=151	ctermbg=None
hi MatchParen     gui=none            ctermfg=7		ctermbg=110

"hi PMenu
"hi PMenuSBar
"hi PMenuSel
"hi PMenuThumb

hi SpecialKey                         ctermfg=60	ctermbg=None

hi SpellBad                           ctermfg=15	ctermbg=131
hi SpellCap                           ctermfg=15	ctermbg=110
"hi SpellLocal
"hi SpellRare

hi StatusLine     gui=none            ctermfg=0		ctermbg=254
hi StatusLineNC   gui=none            ctermfg=234	ctermbg=247
hi VertSplit      gui=none            ctermfg=0		ctermbg=247

hi WildMenu       gui=bold            ctermfg=0		ctermbg=118

"hi TabLine
"hi TabLineFill
"hi TabLineSel

hi Title          gui=bold            ctermfg=171	ctermbg=None

"hi Menu
"hi Scrollbar
"hi Tooltip

"          Syntax         Groups
hi Comment        gui=none            ctermfg=95

hi Constant                           ctermfg=6		ctermbg=None
hi String         gui=none            ctermfg=111	ctermbg=None
"hi Character
hi Number         gui=none            ctermfg=51	ctermbg=None
hi Boolean        gui=none            ctermfg=51	ctermbg=None
"hi Float

hi Identifier                         ctermfg=152
hi Function       gui=none            ctermfg=151	ctermbg=None

hi Statement      gui=none            ctermfg=77
hi Conditional    gui=none            ctermfg=77	ctermbg=None
hi Repeat         gui=none            ctermfg=85	ctermbg=None
"hi Label
hi Operator       gui=none            ctermfg=118	ctermbg=None
hi Keyword        gui=none            ctermfg=77	ctermbg=None
hi Exception      gui=none            ctermfg=77	ctermbg=None

hi PreProc                            ctermfg=117
hi Include        gui=none            ctermfg=146	ctermbg=None
hi Define         gui=none            ctermfg=110	ctermbg=None
hi Macro          gui=none            ctermfg=152	ctermbg=None
hi PreCondit      gui=none            ctermfg=74	ctermbg=None

hi Type           gui=none            ctermfg=110
hi StorageClass   gui=none            ctermfg=110	ctermbg=None
hi Structure      gui=none            ctermfg=110	ctermbg=None
hi Typedef        gui=none            ctermfg=110	ctermbg=None

hi Special                            ctermfg=247
"hi SpecialChar
"hi Tag
"hi Delimiter
"hi SpecialComment
"hi Debug

hi Underlined     gui=underline       ctermfg=102	ctermbg=None
hi Ignore                             ctermfg=67
hi Error                              ctermfg=230	ctermbg=167
hi Todo                               ctermfg=12	ctermbg=8
