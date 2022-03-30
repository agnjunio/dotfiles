call plug#begin('~/.vim/plug')

" Theme stuff
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" IDE Stuff
Plug 'airblade/vim-gitgutter'
Plug 'alvan/vim-closetag'
Plug 'christoomey/vim-tmux-navigator'
Plug 'editorconfig/editorconfig-vim'
Plug 'ervandew/supertab'
Plug 'flazz/vim-colorschemes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdcommenter'
Plug 'rking/ag.vim'

" Language-Agnostic Plugins
Plug 'w0rp/ale'
Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': '/bin/bash install.sh'
      \ }
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}

" Elixir
Plug 'elixir-editors/vim-elixir'

call plug#end()
