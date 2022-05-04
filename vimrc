" Not compatible with old vi
set nocompatible
filetype off

" Vim history
set history=500

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Vundle plugins here
Plugin 'scrooloose/nerdtree'

call vundle#end()

" Enable filetype plugins
filetype plugin on
filetype indent on

" Line numbers
set number
set relativenumber

" Show current position
set ruler

" Height of command bar
set cmdheight=1

" Buffer is hidden when abandoned
set hidden

" Rendering go brrrrrr
set ttyfast

" Enable WiLd menu
set wildmenu

" Configure backspace
set backspace=eol,start,indent

" Searching
set ignorecase
set smartcase
set hlsearch
set incsearch
set magic
set showmatch

" Sounds are annoying...
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add extra margin to the left
set foldcolumn=1

" Syntax Highlighting
syntax enable

" Pretty colors
set background=dark

" Set standard encoding
set encoding=utf8

" Files and backups
set nobackup
set nowb
set noswapfile

" Text, tabs, and spaces
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set lbr
set tw=500
set ai
set si
set wrap
