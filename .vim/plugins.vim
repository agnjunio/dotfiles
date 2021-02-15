call plug#begin('~/.vim/plug')

Plug 'airblade/vim-gitgutter'
Plug 'arakashic/chromatica.nvim'
Plug 'bling/vim-airline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'preservim/nerdcommenter'
Plug 'editorconfig/editorconfig-vim'
Plug 'flazz/vim-colorschemes'
Plug 'rking/ag.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'ervandew/supertab'
Plug 'alvan/vim-closetag'
Plug 'rhysd/vim-clang-format'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': '/bin/bash install.sh'
      \ }
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}

call plug#end()
