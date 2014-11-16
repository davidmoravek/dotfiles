set nocompatible
filetype off

let vundle_initialized = 1
if !filereadable($HOME . "/.vim/bundle/Vundle.vim/README.md")
	echo "Installing Vundle ...\n"
	silent !mkdir -p ~/.vim/bundle
	silent !git clone https://github.com/gmarik/Vundle.vim ~/.vim/bundle/Vundle.vim
	let vundle_initialized = 0
endif

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'

call vundle#end()

if vundle_initialized == 0
	:PluginInstall
	:qa
endif

" general settings
syntax on
set clipboard=unnamed
set encoding=utf-8
set relativenumber
set hlsearch
set smartindent

" airline
set laststatus=2 
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" colors
colorscheme solarized
set background=dark

" custom mappings
map <S-j> :tabprev<CR>
map <S-k> :tabnext<CR>
map <S-t> :tabnew<CR>
map <S-w> :tabclose<CR>
