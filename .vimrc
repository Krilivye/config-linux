set nocompatible   "vIM
set encoding=utf-8 "Must be!
set t_Co=256
set termguicolors

"plug autoinstall
if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall | source $MYVIMRC
    endif

call plug#begin()   "plug init

"Plug 'spf13/PIV' "PHP

Plug 'hdima/python-syntax', {'for': ['python']} "python 3
Plug 'hynek/vim-python-pep8-indent', {'for': ['python']} "pep8 indent

Plug 'jdonaldson/vaxe'

Plug 'python-rope/ropevim', {'for': ['python']} "ropevim
Plug 'alfredodeza/coveragepy.vim', { 'for': ['python']}

Plug 'elzr/vim-json', {'for': ['html', 'json','javascript']} "json syntax / indent
Plug 'plasticboy/vim-markdown', { 'for': ['html','markdown','javascript'] } "markdown syntax / indent
Plug 'pangloss/vim-javascript', { 'for': ['html','jinja','javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx', {'for': ['html','jinja', 'javascript', 'javascript.jsx']} "js syntax / indent
Plug 'nicklasos/vim-jsx-riot', {'for': ['html','jinja','javascript','javascript.jsx']},
Plug 'chase/Vim-Jinja2-Syntax', {'for': ['html','jinja', 'javascript', 'javascript.jsx']} "jinja2 syntax...
Plug 'ap/vim-css-color', {'for': ['html','jinja', 'javascript', 'javascript.jsx', 'css']}  " colorations des #FFFFFF et rgb(0,2,3) dans les fichiers
Plug 'mattn/emmet-vim', {'for': ['html', 'jinja', 'javascript', 'javascript.jsx', 'css']} "ZenCoding pour html/css must read => emmet.io

Plug 'ntpeters/vim-better-whitespace' "Pour virer les espace vide. :StripWhitespace
Plug 'Valloric/MatchTagAlways' "Matching des ()[]{} inteligent
Plug 'tpope/vim-abolish' ":%s mais bien plus cool et pour programmeur... :Subvert
Plug 'tpope/vim-surround' "pour du script-fu  select intelligent dans les ()[]{}
Plug 'tpope/vim-repeat' "la commande . surbooster

Plug 'easymotion/vim-easymotion' "Recherche dans le text très avancé :)
Plug 'w0rp/ale' " Linter
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' } " serveur d'autocompletion externe très performant

Plug 'jimsei/winresizer' " pour la gestion des fenètres
Plug 'jnurmine/Zenburn' " ma colo préféré
Plug 'itchyny/lightline.vim' "Une status line qui rocks et qui pulse
Plug 'tweekmonster/braceless.vim' "Gestion des indents dans python et autres languages sans {}

Plug 'chaoren/vim-wordmotion'
Plug 'dpelle/vim-Grammalecte'

Plug 'junegunn/goyo.vim'

Plug 'whatyouhide/vim-gotham'
Plug 'altercation/vim-colors-solarized'

call plug#end()   "plug load plugin
let g:grammalecte_cli_py="/usr/share/grammalecte-fr/cli.py"

"Needed
set background=light
colorscheme solarized
let g:lightline = { 'colorscheme': 'solarized' }

" Resize des split screen!
autocmd VimResized * :wincmd =


"TABS!
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab


"Minibuffer line
set showmode
set cursorline
set showmatch
set laststatus=2

"search options
set ignorecase
set smartcase
set incsearch
set hlsearch

"popup motions
set wildmenu
set wildmode=list:longest,full
set completeopt=menu,menuone,longest

"need!
set number         "Line number!
set autoindent
set smartindent
set pastetoggle=<F2>

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
set backupcopy=yes

set mouse=a
set autoread

set wrap
set linebreak
set breakindent
set showbreak==>

"C'est un peu pour le bépo ca...
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
autocmd FileType python set colorcolumn=80
autocmd FileType python highlight OverLength ctermbg=red ctermfg=white guibg=#592929
autocmd FileType python match OverLength /\%81v.\+/
autocmd BufNewFile,BufRead *.jinja set ft=jinja

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
let g:user_emmet_leader_key=',,'
let g:user_emmet_mode='n'
autocmd Filetype html,css,jinja,javascript,jsx EmmetInstall

" Ropevim
" -------
let g:ropevim_guess_project = 1

" Jinja
" -----
let g:jinja_syntax_html=1


" Goyo
" ----
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" The Silver Searcher
" -------------------
if executable('ag')
    " Ag in controlp
    let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
            \ --ignore .git
            \ --ignore .svn
            \ --ignore .hg
            \ --ignore .DS_Store
            \ --ignore "**/*.pyc"
            \ --ignore BoostParts
            \ -g ""'
endif


" Braceless
autocmd Filetype python BracelessEnable +indent +highlight

" Coloration des .tag riotjs
let javascript_enable_domhtmlcss = 1
let jsx_ext_required = 0
autocmd BufNewFile,BufRead *.tag.html setlocal ft=javascript

" ALE
let g:ale_python_flake8_args = '--max-line-length=160'
let g:ale_javascript_standard_options = '--plugin riot'

function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

set statusline=%{LinterStatus()}

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
