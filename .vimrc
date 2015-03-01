set nocompatible   "vIM

set t_Co=256       "Terminal support
set encoding=utf-8 "Must be!
set number         "Line number!
colors zenburn

filetype off       "vundle required

set rtp+=~/.vim/bundle/Vundle.vim "vundle required
call vundle#begin()   "vundle init

Plugin 'gmarik/Vundle.vim'

Plugin 'spf13/PIV'

Plugin 'python-rope/ropevim'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'hdima/python-syntax'

Plugin 'chrisbra/csv.vim'

Plugin 'othree/html5.vim'
Plugin 'elzr/vim-json'
Plugin 'plasticboy/vim-markdown'
Plugin 'ap/vim-css-color'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'mattn/emmet-vim'
Plugin 'Glench/Vim-Jinja2-Syntax'

Plugin 'ntpeters/vim-better-whitespace'
Plugin 'Valloric/MatchTagAlways'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'myusuf3/numbers.vim'

Plugin 'Lokaltog/vim-easymotion'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'

Plugin 'scrooloose/nerdtree'

Plugin 'itchyny/lightline.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'wikitopian/hardmode'


call vundle#end()   "vundle load plugin
filetype plugin indent on

" Resize des split screen!
autocmd VimResized * :wincmd =

"TABS!
set tabstop=4
set shiftwidth=4
set expandtab

"Needed
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

let mapleader=","

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
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_comments_and_strings = 1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1

" Emmet
" -----
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key='<C-z>'
autocmd Filetype html,css EmmetInstall

" Ropevim
" -------
let g:ropevim_guess_project = 1

" Syntastics
" ----------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


source ~/.vimrc.bepo

" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir,
    'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
