source ~/.vim/plugins.vim

"--------------- "
" General Config "
" -------------- "

set background="dark"
set nocompatible
"natural splits
set splitbelow
set splitright
set history=1000
" Spaces management
set expandtab
set softtabstop=2
set shiftwidth=2 "> key will move 2 spaces
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
"always show status line"
set laststatus=2

" Golang
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

" Makefile
if has("autocmd")
  autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab
endif

" ------- "
" Theming "
" ------- "

" This theme is dervated from vim-colorschemes
colorscheme ag1
" ExtraWhitespace colors
highlight ExtraWhitespace ctermbg=darkgrey guibg=darkgrey
" Show trailing whitespace and spaces before a tab:
match ExtraWhitespace /\s\+$\| \+\ze\t/

" ---------------------- "
" Key Bindings           "
" ---------------------- "

":let mapleader = ","
" F2: Toggle search hightlight
nnoremap <F2> :set hlsearch!<CR>
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
nnoremap <silent> <leader>/ <Plug>NERDCommenterToggle
vnoremap <silent> <leader>/ <Plug>NERDCommenterToggle
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

" calls Ag.vim with the word under cursor
nnoremap <Leader>ag :Ag <C-r><C-w><C-m>

" FZF
noremap <silent> <C-p> :GFiles -co --exclude-standard<CR>
noremap <silent> <leader>h :History<CR>
" nnoremap <leader>c :Commits<CR>

" GitGutter
nnoremap <silent> <leader>gg :GitGutterSignsToggle<CR>

" Copy to system clipboard (with meta-C support)
vnoremap <leader>y "+y<CR>
vnoremap <M-c> "+y<CR>

" Check syntax stack for cursor position
function! SynStack ()
    for i1 in synstack(line("."), col("."))
        let i2 = synIDtrans(i1)
        let n1 = synIDattr(i1, "name")
        let n2 = synIDattr(i2, "name")
        echo n1 "->" n2
    endfor
endfunction
map <leader>m :call SynStack()<CR>

" Set netrw cache
let g:netrw_home=expand('~/.cache/vim')

" ---------------------- "
" Plugins                "
" ---------------------- "

" Utility function to check if the plugin is enabled

function! PlugLoaded(name)
  return (
        \ has_key(g:plugs, a:name) &&
        \ isdirectory(g:plugs[a:name].dir) &&
        \ stridx(&rtp, g:plugs[a:name].dir) >= 0)
endfunction

" COC

if PlugLoaded("coc.nvim")
  " Use tab for trigger completion with characters ahead and navigate.
  " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
  " other plugin before putting this into your config.
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Make <CR> auto-select the first completion item and notify coc.nvim to
  " format on enter, <cr> could be remapped by other vim plugin
  inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
        \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

  " GoTo code navigation.
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Use K to show documentation in preview window.
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if CocAction('hasProvider', 'hover')
      call CocActionAsync('doHover')
    else
      call feedkeys('K', 'in')
    endif
  endfunction

  " Highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Symbol renaming.
  nmap <leader>rr <Plug>(coc-rename)

  augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  " Applying codeAction to the selected region.
  " Example: `<leader>aap` for current paragraph
  xmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>a  <Plug>(coc-codeaction-selected)

  " Run the Code Lens action on the current line.
  nmap <leader>cl  <Plug>(coc-codelens-action)

  " Add `:Format` command to format current buffer.
  command! -nargs=0 Format :call CocActionAsync('format')a

  " Add `:Fold` command to fold current buffer.
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)

  " Add `:OR` command for organize imports of the current buffer.
  command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

  " Add (Neo)Vim's native statusline support.
  " NOTE: Please see `:h coc-status` for integrations with external plugins that
  " provide custom statusline: lightline.vim, vim-airline.
  set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
endif

" ALE - Asynchronous Lint Engine

if PlugLoaded("ale")
  filetype plugin on
  filetype plugin indent on
  " set omnifunc=syntaxcomplete#Complete
  set omnifunc=ale#completion#OmniFunc

  let g:ale_enabled = 1
  let g:ale_disable_lsp = 1
  " This is done by COC
  let g:ale_completion_enabled = 0
  let g:ale_fix_on_save = 1

  let g:ale_sign_error = '⤫'
  let g:ale_sign_warning = '⚠'

  let g:ale_set_loclist = 1
  let g:ale_set_quickfix = 1
  let g:ale_open_list = 1

  let g:airline#extensions#ale#enabled = 1
  let g:ale_linters = {
        \   'c': ['clangtidy'],
        \   'cpp': [],
        \   'gitcommit': ['gitlint'],
        \   'go': ['golangci-lint'],
        \   'python': ['pycodestyle'],
        \   'javascript': ['eslint'],
        \   'typescript': ['tslint'],
        \   'typescriptreact': ['eslint'],
        \}
  let g:ale_fixers = {
        \   '*': ['remove_trailing_lines', 'trim_whitespace'],
        \   'elixir': ['mix_format'],
        \   'go': ['gofmt', 'goimports'],
        \   'html': ['prettier'],
        \   'javascript': ['eslint', 'prettier'],
        \   'typescript': ['tslint', 'prettier'],
        \   'typescriptreact': ['tslint', 'prettier'],
        \}
  autocmd FileType gitcommit let g:ale_sign_column_always = 1
endif
