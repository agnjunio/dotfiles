" Vim color file
" Maintainer:	Agnaldo Junior <agnaldo.junior01@gmail.com>
" Last Change:	2022 Mai 24

hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "ag1"

" Normal should come first
hi Normal                                                                       guifg=White     guibg=Black
hi Cursor                                                                       guifg=bg        guibg=fg
hi lCursor                                                                      guifg=NONE      guibg=Cyan

" Note: we never set 'term' because the defaults for B&W terminals are OK
hi DiffAdd                            ctermbg=LightBlue                                         guibg=LightBlue
hi DiffChange                         ctermbg=LightMagenta                                      guibg=LightMagenta
hi DiffDelete   ctermfg=Blue	      ctermbg=LightCyan                         guifg=Blue      guibg=LightCyan     gui=bold
hi DiffText                           ctermbg=Red          cterm=bold                           guibg=Red           gui=bold
hi Directory    ctermfg=DarkBlue	                                        guifg=Blue
hi ErrorMsg     ctermfg=DarkGrey      ctermbg=DarkRed	                        guifg=White     guibg=Red
hi FoldColumn   ctermfg=DarkBlue      ctermbg=Grey   	                        guifg=DarkBlue  guibg=Grey
hi Folded       ctermfg=DarkBlue      ctermbg=Grey	                        guifg=DarkBlue  guibg=LightGrey
hi IncSearch                                               cterm=reverse                                            gui=reverse
hi LineNr       ctermfg=Brown	                                                guifg=Brown
hi ModeMsg                                                 cterm=bold	                                            gui=bold
hi MoreMsg      ctermfg=DarkGreen                                               guifg=SeaGreen                      gui=bold
hi NonText      ctermfg=Blue	                                                guifg=gray      guibg=white         gui=bold
hi Pmenu                                                                                        guibg=LightBlue
hi PmenuSel     ctermfg=White	      ctermbg=DarkBlue                          guifg=White     guibg=DarkBlue
hi Question     ctermfg=DarkGreen                                               guifg=SeaGreen                      gui=bold
if &background == "light"
hi Search       ctermfg=NONE	      ctermbg=Yellow                            guifg=NONE      guibg=Yellow
else
hi Search       ctermfg=Black	      ctermbg=LightGrey    cterm=NONE           guifg=Black     guibg=Yellow        gui=NONE
endif
hi SpecialKey   ctermfg=DarkBlue	                                        guifg=Blue
hi StatusLine   ctermfg=yellow 	      ctermbg=blue         cterm=bold           guifg=blue      guibg=gold
hi StatusLineNC	ctermfg=black         ctermbg=blue         cterm=bold	        guifg=blue      guibg=gold
hi Title        ctermfg=DarkMagenta                                             guifg=Magenta                       gui=bold
hi VertSplit                                               cterm=reverse                                            gui=reverse
hi Visual                             ctermbg=NONE	   cterm=reverse        guifg=Grey      guibg=fg            gui=reverse
hi VisualNOS                                               cterm=underline,bold                                     gui=underline,bold
hi WarningMsg   ctermfg=DarkRed	                                                guifg=Red
hi WildMenu     ctermfg=Black	      ctermbg=Yellow                            guifg=Black     guibg=Yellow

" syntax highlighting
hi Comment      ctermfg=Grey                               cterm=NONE           guifg=red2                          gui=NONE
hi Constant     ctermfg=DarkGreen                          cterm=NONE           guifg=green3                        gui=NONE
hi Identifier   ctermfg=LightBlue                          cterm=NONE           guifg=cyan4                         gui=NONE
hi PreProc      ctermfg=DarkMagenta                        cterm=NONE           guifg=magenta3                      gui=NONE
hi Special      ctermfg=DarkRed                            cterm=NONE           guifg=deeppink                      gui=NONE
hi Statement    ctermfg=Magenta	                           cterm=bold           guifg=blue                          gui=bold
hi Type	        ctermfg=Blue	                           cterm=NONE           guifg=blue                          gui=bold

" vim: sw=2
