set nocompatible   "vIM

set t_Co=256       "Terminal support
set encoding=utf-8 "Must be!
set number         "Line number!
colors zenburn

filetype off       "vundle required

set rtp+=~/.vim/bundle/vundle "vundle required
call vundle#rc()   "vundle init

Bundle 'gmarik/vundle'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-surround'
Bundle 'bling/vim-airline'
Bundle 'spf13/PIV'
Bundle 'chrisbra/csv.vim'
Bundle 'jmcantrell/vim-virtualenv'
Bundle 'mattn/emmet-vim'
Bundle 'tpope/vim-abolish'
Bundle 'scrooloose/nerdtree'
Bundle 'ap/vim-css-color'
Bundle 'SirVer/ultisnips'
Bundle 'Valloric/MatchTagAlways'

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

" AirLine
" -------
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" Emmet
" -----
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key='<C-z>'
autocmd Filetype html,css EmmetInstall

source ~/.vimrc.bepo

