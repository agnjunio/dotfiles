" High-level Settings
let g:custom_cquery_cache_path = expand('~/.lsp/clangd-cache')
let g:custom_cquery_log_path = expand('~/.lsp/clangd.log')
let g:custom_pyls_log_path = expand('~/.lsp/pyls.log')
let g:custom_golangserver_log_path = expand('~/.lsp/go-langserver.log')
let g:custom_javascript_server_log_path = expand('~/.lsp/javascript-server.log')
let g:custom_typescript_server_log_path = expand('~/.lsp/typescript-server.log')
let g:custom_vls_log_path = expand('~/.lsp/vls.log')

" Plugin settings
source ~/.vim/plugins.vim

"--------------- "
" General Config "
" -------------- "

"use vim, not vi"
set nocompatible

"natural splits
set splitbelow
set splitright

"history size 1000"
set history=1000

" Use filetype detection and file-based automatic indenting.
filetype plugin indent on

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Use actual tab chars in Makefiles.
  autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab
endif

" Spaces management
set expandtab
set softtabstop=2
set shiftwidth=2 "> key will move 2 spaces

" Tab navigation
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-Left> <Esc>:tabprevious<CR>i
inoremap <C-Right>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

"reload file if it is opened by an external program while editing"
set autoread

"enables wild mode (https://stackoverflow.com/questions/9511253/how-to-effectively-use-vim-wildmenu)"
set wildmenu

"search
set hlsearch "highlight search results"
set incsearch "incremental search (search as you press keys)"
set ignorecase "case insensitive search"
set smartcase

set ruler "always show cursor's current position"

"command bar height"
set cmdheight=2

"backspace in normal mode"
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set magic " Set magic on, for regular expressions
set showmatch " Show matching bracets when text indicator is over them
set mat=10 " How many tenths of second to blink

"line number"
set number

"no text wrapping"
set nolinebreak
set wrap

" ----------- "
" Status Line "
" ----------- "

"always show status line"
set laststatus=2

"status line message"
if has('statusline')
  " Broken down into easily includeable segments "
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

  set statusline=%<%f\ " Filename"
  set statusline+=%w%h%m%r " Options"
  set statusline+=\[%{&ff}/%Y] " filetype"
  "set statusline+=\[%{getcwd()}] "" currentdir"
  set statusline+=%{fugitive#statusline()} " Git Hotness"
  set statusline+=%=%-14.(%l,%c%V%)\%p%% " Right aligned file nav info"
endif

" ------- "
" Theming "
" ------- "

" airline
let g:airline_powerline_fonts = 1
let g:airline_theme='murmur'

" vim-colorschemes
:source ~/.vim/setcolors.vim
colorscheme ag1

" ---------------------- "
" Plugins & Key Bindings "
" ---------------------- "

"leader key"
:let mapleader = ","

" F2: Toggle search hightlight
" nnoremap <F2> :set hlsearch!<CR>

" strings to use in 'list' mode
set listchars=eol:↲,tab:→\ ,trail:·,extends:⟩,precedes:⟨,space:␣

" F3: Toggle list (display unprintable characters).
nnoremap <F3> :set list!<CR>

" F4: Toggle line numbers
nnoremap <F4> :set invnumber<CR>
vnoremap <F4> :set invnumber<CR>
inoremap <F4> :set invnumber<CR>

" move lines easily
nnoremap <S-Down> :m .+1<CR>==
nnoremap <S-Up> :m .-2<CR>==
inoremap <S-Down> <Esc>:m .+1<CR>==gi
inoremap <S-Up> <Esc>:m .-2<CR>==gi
vnoremap <S-Down> :m '>+1<CR>gv=gv
vnoremap <S-Up> :m '<-2<CR>gv=gv

" navigate between multiple open files
nnoremap <leader><Right> :tabnext<CR>
nnoremap <leader><Left> :tabprevious<CR>
nnoremap <leader><Up> :tabmove +1<CR>
nnoremap <leader><Down> :tabmove -1<CR>
nnoremap <leader>q :tabclose<CR>
nnoremap <leader>t :tabnew<CR>

" Ctrl-S to save file (assuming terminal doesn't catch the keys)
" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
command -nargs=0 -bar Update if &modified
\|    if empty(bufname('%'))
\|        browse confirm write
\|    else
\|        confirm write
\|    endif
\|endif
nnoremap <silent> <C-S> :<C-u>Update<CR>

" Leader-S to save as root (sudo tee trick)
nnoremap <leader>w :w !sudo tee %<CR>

" Fast replace command
nnoremap <Leader>ss :%s,\<<C-r><C-w>\>,

" NERDCommenter
let g:NERDCreateDefaultMappings = 0
nmap <silent> <C-_> <Plug>NERDCommenterToggle
vma <silent> <C-_> <Plug>NERDCommenterToggle

let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

" calls Ag.vim with the word under cursor
nnoremap <Leader>ag :Ag <C-r><C-w><C-m>

" FZF
noremap <C-p> :GFiles -co --exclude-standard<CR>
nnoremap <leader>c :Commits<CR>
nnoremap <leader>h :History<CR>

" GitGutter {
nnoremap <silent> <leader>gg :GitGutterSignsToggle<CR>

" Copy to X CLIPBOARD
map <leader>cc :w !xclip -selection c<CR>
map <leader>cp :w !xclip -selection p<CR>
map <leader>cs :w !xclip -selection s<CR>
" Paste from X CLIPBOARD
map <leader>pc :r!xclip -o -selection c<CR>
map <leader>pp :r!xclip -o -selection p<CR>
map <leader>ps :r!xclip -o -selection s<CR>

" Set netrw cache
let g:netrw_home=expand('~/.cache/vim')

" ----------- "
" Code syntax "
" ----------- "

" Python
:let python_highlight_all = 1

"syntax enable"
syn on

" ExtraWhitespace colors
highlight ExtraWhitespace ctermbg=darkgrey guibg=darkgrey

" Show trailing whitespace and spaces before a tab:
match ExtraWhitespace /\s\+$\| \+\ze\t/

" ------------------------ "
" Language Client Settings "
" ------------------------ "

" ALE - Asynchronous Lint Engine
let g:ale_enabled = 1
let g:ale_completion_enabled = 0
let g:ale_fix_on_save = 1

let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 1

let g:airline#extensions#ale#enabled = 1
let g:ale_linters = {
      \   'gitcommit': ['gitlint'],
      \   'python': ['pycodestyle'],
      \   'cpp': [],
      \   'c': ['clangtidy'],
      \   'go': ['golangci-lint'],
      \   'typescript': ['tslint'],
      \}
let g:ale_fixers = {
      \   'go': ['gofmt', 'goimports'],
      \   'typescript': ['tslint', 'prettier'],
      \   'html': ['prettier'],
      \}
autocmd FileType gitcommit let g:ale_sign_column_always = 1

" Deoplete settings
let g:deoplete#enable_at_startup = 0
let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'
call deoplete#custom#source('LanguageClient',
      \ 'min_pattern_length',
      \ 2)

set hidden
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
      \ 'rust':       ['rustup', 'run', 'stable-x86_64-unknown-linux-gnu', 'rls'],
      \ 'c':          ['clangd'],
      \ 'cpp':        ['clangd'],
      \ 'python':     ['pyls', '--log-file', g:custom_pyls_log_path],
      \ 'sh':         ['bash-language-server', 'start'],
      \ 'lua':        ['lua-lsp'],
      \ 'go':         ['go-langserver', '-logfile', g:custom_golangserver_log_path],
      \ 'typescript': ['typescript-language-server', '--stdio', '--tsserver-log-file', g:custom_typescript_server_log_path],
      \ }

let g:LanguageClient_loadSettings = 0 " Use an absolute configuration path if you want system-wide settings
let g:LanguageClient_settingsPath = expand('~/.config/nvim/settings.json')
set completefunc=LanguageClient#complete
set formatexpr=LanguageClient_textDocument_rangeFormatting()

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <Leader>rd :call LanguageClient_textDocument_definition()<CR>
nnoremap <Leader>ri :call LanguageClient_textDocument_implementation()<CR>
nnoremap <Leader>rf :call LanguageClient_textDocument_references()<CR>
nnoremap <Leader>rh :call LanguageClient_textDocument_hover()<CR>
nnoremap <Leader>rr :call LanguageClient_textDocument_rename()<CR>
nnoremap <Leader>rs :call LanguageClient_textDocument_documentSymbol()<CR>
nnoremap <Leader>ff :call LanguageClient_textDocument_formatting()<CR>
nnoremap <Leader>. :call LanguageClient_textDocument_codeAction()<CR>

" vim-clang-format configs {
  " map to <Leader>cf in C++ code
  autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
  autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
  nmap <Leader>C :ClangFormatAutoToggle<CR>

  autocmd FileType c ClangFormatAutoEnable
  autocmd BufWritePre *.cpp,*.hpp ClangFormat
" }

" Golang configs
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4
