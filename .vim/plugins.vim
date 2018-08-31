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
Plug 'w0rp/ale'
Plug 'ervandew/supertab'
Plug 'rhysd/vim-clang-format'

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
