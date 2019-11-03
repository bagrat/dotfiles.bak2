set rtp^=$DOTFILES/vim

let mapleader=','

if empty(glob($DOTFILES . '/vim/autoload/plug.vim'))
  echo "Downloading Plug..."
  silent !curl -fsSLo $DOTFILES/vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | qal!
endif

call plug#begin("~/.vim/bundle")

Plug 'arcticicestudio/nord-vim' 

Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'

Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'christoomey/vim-tmux-navigator'

Plug 'dyng/ctrlsf.vim'

Plug 'itchyny/lightline.vim'
Plug 'gcavallanti/vim-noscrollbar'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'

Plug 'w0rp/ale'

Plug 'bagrat/vim-buffet'
Plug 'bagrat/vim-wild-gitignore'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

Plug 'elixir-editors/vim-elixir'
Plug 'mhinz/vim-mix-format'

Plug 'mattn/emmet-vim'

call plug#end()

for f in split(glob($DOTFILES . '/vim/config/*.vim'), '\n')
    execute 'source' f
endfor
