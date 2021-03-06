set nocompatible "Making sure vim starts without honering vi support
set encoding=utf-8
set number relativenumber "enable absolute numbering of current line and relative of other lines
syntax enable
set breakindent "for having the wrapping lines use the indention level
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

	"For quick horisontal movement by higlighting uniq characthers
    Plug 'unblevable/quick-scope'

	"For having vertical lines on indents
	Plug 'lukas-reineke/indent-blankline.nvim'

	" For intergrating with discord 'now playing' rich presence
	Plug 'andweeb/presence.nvim'

call plug#end()

" set the colorscheme
colorscheme gruvbox

if (has("termguicolors"))
	set termguicolors
endif

"Chang the characther used for indent lines, based on level of indention
let g:indent_blankline_char_list = ['|', '¦', '┆', '┊']
