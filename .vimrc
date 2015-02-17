set nocompatible   "vIM

set t_Co=256       "Terminal support
set encoding=utf-8 "Must be!
set number         "Line number!
colors zenburn

filetype off       "vundle required

set rtp+=~/.vim/bundle/Vundle.vim "vundle required
call vundle#begin()   "vundle init

Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'itchyny/lightline.vim'
Plugin 'spf13/PIV'
Plugin 'chrisbra/csv.vim'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-abolish'
Plugin 'scrooloose/nerdtree'
Plugin 'ap/vim-css-color'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/MatchTagAlways'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'jelera/vim-javascript-syntax'

call vundle#end()   "vundle load plugin

"TABS!
set tabstop=4
set shiftwidth=4
set expandtab

"Needed
filetype plugin on
filetype plugin indent on
syntax on

"Minibuffer line
set showmode
set cursorline
set showmatch
let g:airline_powerline_fonts =1
set laststatus=2

"search options
set ignorecase
set smartcase
set incsearch
set hlsearch

"popup motions
set wildmenu
set wildmode=list:longest,full

"need!
set autoindent
set smartindent
nmap <F8> :TagbarToggle<CR>

"comfort
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

"Column size
set cc=80
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" UltiSnips
" ---------
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
let g:UltiSnipsDontReverseSearchPath=1

" YouCompleteMe
" -------------
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_comments_and_strings = 1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_min_num_of_chars_for_completion = 1

" Emmet
" -----
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key='<C-z>'
autocmd Filetype html,css EmmetInstall

source ~/.vimrc.bepo
