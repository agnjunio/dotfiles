call plug#begin('~/.vim/plug')

" Theme stuff
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" IDE Stuff
Plug 'airblade/vim-gitgutter'
Plug 'alvan/vim-closetag'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdcommenter'
Plug 'rking/ag.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Language-Agnostic Plugins
Plug 'w0rp/ale'

" Elixir
Plug 'elixir-editors/vim-elixir'

call plug#end()
