" High-level Settings
let g:custom_cquery_cache_path = expand('~/.lsp/cquery-cache')
let g:custom_cquery_log_path = expand('~/.lsp/cquery.log')
let g:custom_pyls_log_path = expand('~/.lsp/pyls.log')

if has('nvim')
  let g:custom_lsp_plugin = "LanguageClient"
else
  let g:custom_lsp_plugin = "vim-lsp"
endif

" Plugin settings
source ~/.vim/plugins.vim

"--------------- "
" General Config "
" -------------- "

"use vim, not vi"
set nocompatible

"history size 1000"
set history=1000

" Only do this part when compiled with support for autocommands.
if has("autocmd")
    " Use filetype detection and file-based automatic indenting.
    filetype plugin indent on

    " Use actual tab chars in Makefiles.
    autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab
endif
"tab management
set expandtab
set softtabstop=2
set shiftwidth=2 "> key will move 2 spaces

"reload file if it is opened by an external program while editing"
set autoread

"enables mouse"
"set mouse=a

"enables keys to pass through tmux"
if has('nvim')
  "todo
else
  set term=xterm-256color
endif

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

augroup project
  autocmd!
  autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END

" ------- "
" Theming "
" ------- "

" airline {
let g:airline_powerline_fonts = 1
let g:airline_theme='murmur'
" }

" vim-colorschemes {
:source ~/.vim/setcolors.vim
colorscheme ag1
" }

" ---------------------- "
" Plugins & Key Bindings "
" ---------------------- "

"leader key"
:let mapleader = ","

" F2: Toggle search hightlight
nnoremap <F2> :set hlsearch!<CR>

" strings to use in 'list' mode
if ('nvim')
  set listchars=eol:↲,tab:→\ ,trail:·,extends:⟩,precedes:⟨,space:␣
else
  set listchars=eol:↲,tab:→\ ,trail:·,extends:⟩,precedes:⟨,nbsp:␣
endif
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
nnoremap <leader>q :tabclose<CR>
nnoremap <leader>t :tabnew#<CR>

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

" NERDtree {
  nnoremap <silent> <leader><tab> :NERDTreeToggle<CR>

  map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
  map <leader>e :NERDTreeFind<CR>
  nmap <leader>nt :NERDTreeFind<CR>

  let NERDTreeShowBookmarks=1
  let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr', '\.bak', '\.o', '\.e', '\.obj']
  let NERDTreeChDirMode=0
  let NERDTreeQuitOnOpen=1
  let NERDTreeShowHidden=1
  let NERDTreeKeepTreeInNewTab=1
"}

" NERDCommenter {
  let g:NERDCreateDefaultMappings = 0
  nmap <silent> <C-_> <Plug>NERDCommenterToggle
  vmap <silent> <C-_> <Plug>NERDCommenterToggle
  imap <C-_> <Plug>NERDCommenterInsert
" }

" ag {
  " Ctrl-Shift-f calls Ag.vim
  nnoremap <C-S-F> :Ag<space>
  " <leader>ag calls Ag.vim with the word under cursor
  nnoremap <Leader>ag :Ag <C-r><C-w><C-m>
"}

" Normal search with ctrl f
nnoremap <C-F> /

" ctrlp {
  let g:ctrlp_working_path_mode = '0'
  let g:ctrlp_root_markers = ['.git', '.repo', '.pro', 'package.json', 'build.xml', 'main.ncl' ]

  set wildignore+=LayoutTests/,PerformanceTests/,Websites/,*.un~'

  let g:ctrlp_custom_ignore = {
    \ 'dir': '\.git$\|\.hg$\|\.svn$',
    \ 'file': '\.exe$\|\.so$\|\.dll$\|\.class' }
  let g:ctrlp_user_command = {
    \ 'types': {
      \ 1: ['.git', 'ag %s -l --nocolor --hidden -g "" --ignore node_modules --ignore bower_components'],
      \ 2: ['.hg', 'hg --cwd %s locate -I .'],
      \ },
    \ 'fallback': 'find %s -type f | grep "\.cpp\$\|\.h\$\|\.cmake\$\|\.messages.in\$\|.txt\|\.js\|\.json\$\|\.java\$"'
  \ }
"}

" GitGutter {
  nnoremap <silent> <leader>gg :GitGutterSignsToggle<CR>
  " nnoremap <silent> <leader>gh :GitGutterLineHighlightsToggle<CR>
  " nnoremap <silent> <leader>ga :GitGutterToggle<CR>
" }

" Copy to X CLIPBOARD
nnoremap <silent> <leader>cc :w !xsel -i -b<CR>
map <leader>cp :w !xsel -i -p<CR>
map <leader>cs :w !xsel -i -s<CR>
" Paste from X CLIPBOARD
map <leader>pp :r!xsel -p<CR>
map <leader>ps :r!xsel -s<CR>
map <leader>pb :r!xsel -b<CR>

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

" Syntastic {
  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0

  let g:syntastic_javascript_checkers = ['eslint']
  let g:syntastic_javascript_eslint_exe = 'npm run lint --'

  let g:loaded_syntastic_java_javac_checker = 1

  nnoremap <leader>R :SyntasticReset<CR>
" }

" ------------------------ "
" Language Client Settings "
" ------------------------ "

" ALE - Asynchronous Lint Engine
let g:ale_enabled = 1
let g:ale_completion_enabled = 0

let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
"let g:ale_open_list = 1

let g:airline#extensions#ale#enabled = 1
let g:ale_linters = {
      \   'gitcommit': ['gitlint'],
      \   'python': ['pyls'],
      \   'cpp': [],
      \   'c': ['clangtidy'],
      \}
autocmd FileType gitcommit let g:ale_sign_column_always = 1

if g:custom_lsp_plugin == "vim-lsp"
  let g:lsp_signs_enabled = 1 "enable signs
  let g:lsp_diagnostics_echo_cursor = 1 "enable echo under cursor when in normal mode

  let g:lsp_signs_error = {'text': '⤫'}
  let g:lsp_signs_warning = {'text': '⚠'}
  let g:lsp_signs_hint = {'text': 'ℹ'}

  let g:lsp_log_verbose = 0
  let g:lsp_log_file = expand('~/.lsp/vim-lsp.log')
  let g:asyncomplete_log_file = expand('~/.lsp/asyncomplete.log')

  if executable('cquery')
     au User lsp_setup call lsp#register_server({
        \ 'name': 'cquery',
        \ 'cmd': {server_info->['cquery', '--log-file', g:custom_cquery_log_path]},
        \ 'root_uri': {server_info->lsp#utils#path_to_uri(
                \ lsp#utils#find_nearest_parent_file_directory(
                \ lsp#utils#get_buffer_path(), 'compile_commands.json'))},
        \ 'initialization_options': { 'cacheDirectory': g:custom_cquery_cache_path },
        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
        \ })
  endif

  if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls', '--log-file', g:custom_pyls_log_path]},
        \ 'whitelist': ['python'],
        \ })
  endif

  if executable('rustup')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'stable-x86_64-unknown-linux-gnu', 'rls']},
        \ 'whitelist': ['rust'],
        \ })
  endif

  let g:autofmt_autosave = 1
  let g:lsp_signs_enabled = 1         " enable signs
  let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode

  nnoremap <Leader>rj :LspDefinition<CR>
  nnoremap <Leader>ri :LspImplementation<CR>
  nnoremap <Leader>rf :LspReferences<CR>
  nnoremap <Leader>rh :LspHover<CR>
  nnoremap <Leader>rr :LspRename<CR>
  nnoremap <Leader>rs :LspDocumentSymbol<CR>
  nnoremap <Leader>ff :LspDocumentFormat<CR>

elseif g:custom_lsp_plugin == "LanguageClient" " LanguageClient_neovim

  let g:deoplete#enable_at_startup = 1
  let g:deoplete#enable_smart_case = 1
  let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
  let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'

  set hidden
  let g:LanguageClient_autoStart = 1
  let g:LanguageClient_serverCommands = {
    \ 'rust':   ['rustup', 'run', 'stable-x86_64-unknown-linux-gnu', 'rls'],
    \ 'c':      ['cquery', '--log-file', g:custom_cquery_log_path],
    \ 'cpp':    ['cquery', '--log-file', g:custom_cquery_log_path],
    \ 'python': ['pyls', '--log-file', g:custom_pyls_log_path],
    \ 'sh':     ['bash-language-server', 'start'],
    \ 'lua':    ['lua-lsp'],
  \ }

  let g:LanguageClient_loadSettings = 1 " Use an absolute configuration path if you want system-wide settings
  let g:LanguageClient_settingsPath = expand('~/.config/nvim/settings.json')
  set completefunc=LanguageClient#complete
  set formatexpr=LanguageClient_textDocument_rangeFormatting()

  nnoremap <Leader>rj :call LanguageClient_textDocument_definition()<CR>
  nnoremap <Leader>rf :call LanguageClient_textDocument_references()<CR>
  nnoremap <Leader>rh :call LanguageClient_textDocument_hover()<CR>
  nnoremap <Leader>rr :call LanguageClient_textDocument_rename()<CR>
  nnoremap <Leader>rs :call LanguageClient_textDocument_documentSymbol()<CR>
  nnoremap <Leader>ff :call LanguageClient_textDocument_formatting()<CR>

endif

" vim-clang-format configs {
  " map to <Leader>cf in C++ code
  autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
  autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
  nmap <Leader>C :ClangFormatAutoToggle<CR>

  autocmd FileType c ClangFormatAutoEnable
  autocmd BufWritePre *.cpp,*.hpp ClangFormat
" }
