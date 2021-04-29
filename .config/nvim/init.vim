set encoding=utf-8
set number relativenumber "enable absolute numbering of current line and relative of other lines
syntax enable
set swapfile
set scrolloff=7
set backspace=indent,eol,start
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set autoindent
set fileformat=unix

let mapleader="," "map leader key to comma
set clipboard+=unnamedplus "copy to system clipboard

" auto-install vim-plug if not present
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync
endif

" auto-install missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" load plugins
call plug#begin('~/.config/nvim/autoload/plugged')

    "Color theme
    Plug 'morhetz/gruvbox'

	"Status bar
	Plug 'vim-airline/vim-airline'

call plug#end()

" set the colorscheme
colorscheme gruvbox

if (has("termguicolors"))
	set termguicolors
endif
