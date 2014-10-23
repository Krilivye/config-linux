set t_Co=256
set encoding=utf-8
set number

set rtp+=~/powerline/powerline/bindings/vim
set laststatus=2

source ~/.vimrc.bepo
colors zenburn

filetype plugin on
set omnifunc=syntaxcomplete#Complete

set tabstop=4
set shiftwidth=4
set expandtab

filetype plugin indent on
syntax on

set showmode
set cursorline
set showmatch

set ignorecase
set smartcase
set incsearch
set hlsearch

set wildmenu
set wildmode=list:longest,full

set autoindent
set smartindent
nmap <F8> :TagbarToggle<CR>

set history=1000
set undolevels=1000
set clipboard+=unnamed
set ruler
set showcmd
set showmode
set matchpairs+=<:>
set title

set mouse=a
set autoread

let g:user_emmet_install_global = 0
autocmd Filetype html,css EmmetInstall
