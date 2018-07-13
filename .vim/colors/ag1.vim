" Vim color file
" Maintainer:	Juan frias <juandfrias at gmail dot com>
" Last Change:	2007 Mar 29
" Version:	1.0.0
" URL:		http://www.axisym3.net/jdany/vim-the-editor/#oceanblack256
"
" These are the colors of the "OceanBlack" theme by Chris Vertonghen modified
" to work on 256-color xterms.
"
set background=dark

highlight clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "ag1"

highlight Normal         cterm=none           ctermfg=7 ctermbg=None
highlight NonText        cterm=none           ctermfg=117 ctermbg=None

highlight Visual         cterm=reverse        ctermfg=72  ctermbg=15
highlight VisualNOS      cterm=bold,underline ctermfg=151 ctermbg=None

highlight Cursor         cterm=none           ctermfg=15  ctermbg=152
highlight CursorIM       cterm=bold           ctermfg=15  ctermbg=152
"highlight CursorColumn
"highlight CursorLine


highlight Directory      ctermfg=5            ctermbg=None

highlight DiffAdd        cterm=none           ctermfg=15  ctermbg=22
highlight DiffChange     cterm=none           ctermfg=207 ctermbg=90
highlight DiffDelete     cterm=none           ctermfg=19  ctermbg=17
highlight DiffText       cterm=bold           ctermfg=226 ctermbg=90

highlight Question       cterm=bold           ctermfg=85  ctermbg=None
highlight ErrorMsg       ctermfg=230          ctermbg=167
highlight ModeMsg        ctermfg=77           ctermbg=22
highlight MoreMsg        cterm=bold           ctermfg=72  ctermbg=None
highlight WarningMsg     cterm=bold           ctermfg=203 ctermbg=None

highlight LineNr         ctermfg=243          ctermbg=233
highlight Folded         cterm=none           ctermfg=152 ctermbg=66
highlight FoldColumn     cterm=none           ctermfg=152 ctermbg=66
"highlight SignColumn

highlight Search         cterm=none           ctermfg=16  ctermbg=66
highlight IncSearch      cterm=reverse        ctermfg=151 ctermbg=None
highlight MatchParen     cterm=none           ctermfg=7   ctermbg=110

"highlight PMenu
"highlight PMenuSBar
"highlight PMenuSel
"highlight PMenuThumb

highlight SpecialKey     ctermfg=60           ctermbg=None

highlight SpellBad       ctermfg=15           ctermbg=131
highlight SpellCap       ctermfg=15           ctermbg=110
"highlight SpellLocal
"highlight SpellRare

highlight StatusLine     cterm=none           ctermfg=0   ctermbg=254
highlight StatusLineNC   cterm=none           ctermfg=234 ctermbg=247
highlight VertSplit      cterm=none           ctermfg=0   ctermbg=247

highlight WildMenu       cterm=bold           ctermfg=0   ctermbg=118

"highlight TabLine
"highlight TabLineFill
"highlight TabLineSel

highlight Title          cterm=bold           ctermfg=171 ctermbg=None

"highlight Menu
"highlight Scrollbar
"highlight Tooltip

"          Syntax         Groups
highlight Comment        cterm=none           ctermfg=95

highlight Constant       ctermfg=6            ctermbg=None
highlight String         cterm=none           ctermfg=111 ctermbg=None
"highlight Character
highlight Number         cterm=none           ctermfg=51  ctermbg=None
highlight Boolean        cterm=none           ctermfg=51  ctermbg=None
"highlight Float

highlight Identifier     ctermfg=152
highlight Function       cterm=none           ctermfg=151 ctermbg=None

highlight Statement      cterm=none           ctermfg=77
highlight Conditional    cterm=none           ctermfg=77  ctermbg=None
highlight Repeat         cterm=none           ctermfg=85  ctermbg=None
"highlight Label
highlight Operator       cterm=none           ctermfg=118 ctermbg=None
highlight Keyword        cterm=none           ctermfg=77  ctermbg=None
highlight Exception      cterm=none           ctermfg=77  ctermbg=None

highlight PreProc        ctermfg=117
highlight Include        cterm=none           ctermfg=146 ctermbg=None
highlight Define         cterm=none           ctermfg=110 ctermbg=None
highlight Macro          cterm=none           ctermfg=152 ctermbg=None
highlight PreCondit      cterm=none           ctermfg=74  ctermbg=None

highlight Type           cterm=none           ctermfg=110
highlight StorageClass   cterm=none           ctermfg=110 ctermbg=None
highlight Structure      cterm=none           ctermfg=110 ctermbg=None
highlight Typedef        cterm=none           ctermfg=110 ctermbg=None

highlight Special        ctermfg=247
"highlight SpecialChar
"highlight Tag
"highlight Delimiter
"highlight SpecialComment
"highlight Debug

highlight Underlined     cterm=underline      ctermfg=102 ctermbg=None

highlight Ignore         ctermfg=67

highlight Error          ctermfg=230          ctermbg=167

highlight Todo           ctermfg=12           ctermbg=8
