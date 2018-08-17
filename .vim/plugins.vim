call plug#begin('~/.vim/plug')

Plug 'airblade/vim-gitgutter'
Plug 'arakashic/chromatica.nvim'
Plug 'bling/vim-airline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ddollar/nerdcommenter'
Plug 'editorconfig/editorconfig-vim'
Plug 'flazz/vim-colorschemes'
Plug 'kien/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline-themes'

" ALE (Async Lint Engine) configs {
  Plug 'w0rp/ale'

  let g:ale_enabled = 1

  let g:ale_sign_error = '⤫'
  let g:ale_sign_warning = '⚠'

  let g:ale_set_loclist = 0
  "let g:ale_set_quickfix = 1
  "let g:ale_open_list = 1

  " Enable integration with airline.
  let g:airline#extensions#ale#enabled = 1
  let g:ale_linters = {
  \   'gitcommit': ['gitlint'],
  \   'python': ['flake8'],
  \   'cpp': [],
  \   'c': ['clangtidy'],
  \}
  autocmd FileType gitcommit let g:ale_sign_column_always = 1
  "let g:ale_gitcommit_gitlint_options = '-C ~/.tcl-patcher/gitlint.ini'

  " Ctrl-j/k to navigate through ALI Errors/Warnings
  " nmap <silent> <C-k> <Plug>(ale_previous_wrap)
  " nmap <silent> <C-j> <Plug>(ale_next_wrap)

  " au FileType go :ALEEnable
" }

Plug 'ervandew/supertab'
if has('nvim')
  Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': '/bin/bash install.sh'
    \ }
  Plug 'Shougo/neoinclude.vim'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'prabirshrestha/async.vim'
  Plug 'prabirshrestha/vim-lsp'
  Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'prabirshrestha/asyncomplete-lsp.vim'
endif
let g:deoplete#enable_at_startup = 1

call plug#end()
