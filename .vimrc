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
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'

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

" ctrlp
let g:ctrlp_map = '<C-P>'

" custom mappings
map <S-J> :tabprev<CR>
map <S-K> :tabnext<CR>
map <S-T> :tabnew<CR>
map <S-W> :tabclose<CR>

map <C-J> :bprevious<CR>
map <C-K> :bnext<CR>
