set nocompatible   "vIM

syntax off

set t_Co=256       "Terminal support
set encoding=utf-8 "Must be!
set number         "Line number!

filetype off       "vundle required

set rtp+=~/.vim/bundle/Vundle.vim "vundle required
call vundle#begin()   "vundle init

Plugin 'gmarik/Vundle.vim' "vundle! automaj!

"Plugin 'spf13/PIV' "PHP

Plugin 'python-rope/ropevim' "ropevim
Plugin 'hynek/vim-python-pep8-indent' "pep8 indent
Plugin 'hdima/python-syntax' "python 3

Plugin 'chrisbra/csv.vim' "Gestion des fichiers CSV

Plugin 'othree/html5.vim' "html5 syntax / indent
Plugin 'elzr/vim-json' "json syntax / indent
Plugin 'plasticboy/vim-markdown' "markdown syntax / indent
Plugin 'ap/vim-css-color' " colorations des #FFFFFF et rgba(0,2,3) dans les fichiers!
Plugin 'pangloss/vim-javascript' "js syntax / indent extension
Plugin 'jelera/vim-javascript-syntax' "js syntax / indent
Plugin 'mattn/emmet-vim' "ZenCoding pour html/css must read => emmet.io
Plugin 'chase/Vim-Jinja2-Syntax' "jinja2 syntax...
Plugin 'nathanaelkane/vim-indent-guides' " indent for callback!

Plugin 'ntpeters/vim-better-whitespace' "Pour virer les espace vide. :StripWhitespace
Plugin 'Valloric/MatchTagAlways' "Matching des ()[]{} inteligent
Plugin 'tpope/vim-abolish' ":%s mais bien plus cool et pour programmeur... :Subvert
Plugin 'tpope/vim-surround' "pour du script-fu  select intelligent dans les ()[]{}
Plugin 'tpope/vim-repeat' "la commande . surbooster
Plugin 'terryma/vim-multiple-cursors' "Pour les pas douer comme moi de la selection en block

Plugin 'Lokaltog/vim-easymotion' "Recherche dans le text très avancé :)
Plugin 'SirVer/ultisnips' " snippets
Plugin 'honza/vim-snippets' " bibliothèques de snippets
Plugin 'scrooloose/syntastic' " check style
Plugin 'Valloric/YouCompleteMe' " serveur d'autocompletion externe très performant
Plugin 'ctrlpvim/ctrlp.vim' " controlp

Plugin 'scrooloose/nerdtree' " pour l'exploration de fichiers
Plugin 'jimsei/winresizer' " pour la gestion des fenètres
Plugin 'jnurmine/Zenburn' " ma colo préféré
Plugin 'itchyny/lightline.vim' "Une status line qui rocks et qui pulse
Plugin 'tweekmonster/braceless.vim' "Gestion des indents dans python et autres languages sans {} 
Plugin 'wikitopian/hardmode' " HARDCORE mode pour vim... plus de flèches et autres...


call vundle#end()   "vundle load plugin
syntax enable
set background=dark
colorscheme zenburn
"colorscheme solarized
"let g:solarized_termcolors=256

"Needed
filetype plugin indent on

" Resize des split screen!
autocmd VimResized * :wincmd =

"TABS!
set tabstop=4
set shiftwidth=4
set expandtab


"Minibuffer line
set laststatus=2
set showmode
set cursorline
set showmatch
let g:airline_powerline_fonts =1

"search options
set ignorecase
set smartcase
set incsearch
set hlsearch

"popup motions
set wildmode=longest,list,full
set wildmenu
set completeopt=menu,menuone,longest

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
set foldlevelstart=99
set autoread

set mouse=a
set pastetoggle=<F2>
set autoread

set wrap
set linebreak
set breakindent
set showbreak==>

let mapleader=","

"Easy-motion
nmap s <Plug>(easymotion-s)
xmap s <Plug>(easymotion-s)
omap s <Plug>(easymotion-s)

map f <Plug>(easymotion-f)
map F <Plug>(easymotion-F)

map w <Plug>(easymotion-bd-w)
map W <Plug>(easymotion-bd-W)

map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>h <Plug>(easymotion-linebackward)
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0

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
let g:user_emmet_leader_key='<C-Space>'
autocmd Filetype html,css,jinja EmmetInstall

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
let g:syntastic_python_flake8_args = '--ignore=E501'

" CtrlP
" -----
let g:ctrlp_map = '<c-p>'
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
            \ --ignore .git
            \ --ignore .svn
            \ --ignore .hg
            \ --ignore .DS_Store
            \ --ignore "**/*.pyc"
            \ --ignore BoostParts
            \ -g ""'
" Braceless
" ---------
autocmd FileType python BracelessEnable +indent +highlight

let g:jinja_syntax_html=1

" source ~/.vimrc.bepo
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()


" Coloration des .tag riotjs
let javascript_enable_domhtmlcss = 1
let jsx_ext_required = 0
au BufNewFile,BufRead *.tag setlocal ft=htm


nnoremap <leader>ev :vs $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>


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
