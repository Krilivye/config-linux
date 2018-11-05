set termguicolors

set shell=sh
let mapleader=","

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  echo "Installing Vim-Plug..."
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall -- sync | source $MYVIMRC
endif


call plug#begin(expand('~/.config/nvim/plugged')) "Plug init
"*****************************************************************************
"" Plug install packages
"*****************************************************************************
Plug 'python-rope/ropevim',{'for': ['python']} "ropevim
Plug 'hynek/vim-python-pep8-indent', {'for': ['python']} "pep8 indent
Plug 'hdima/python-syntax', {'for': ['python']} "python 3
Plug 'alfredodeza/coveragepy.vim', {'for': ['python']}

Plug 'ambv/black' " Python BLACK :Black

Plug 'godlygeek/tabular' " :Tab=/ BOOM!
Plug 'plasticboy/vim-markdown' "markdown syntax / indent
Plug 'kylef/apiblueprint.vim' " API Blueprint
Plug 'dag/vim-fish'
Plug 'chase/vim-ansible-yaml'

Plug 'othree/html5.vim', {'for': ['html', 'jinja', 'javascript']} "html5 syntax / indent
Plug 'othree/yajs.vim', {'for': ['html','jinja', 'javascript']} "js syntax / indent
Plug 'othree/javascript-libraries-syntax.vim', {'for': ['html','jinja', 'javascript']} "js syntax / indent
Plug 'gavocanov/vim-js-indent', {'for': ['html','jinja', 'javascript']} "js syntax / indent extension
Plug 'mxw/vim-jsx', {'for': ['html','jinja', 'javascript']} "js syntax / indent
Plug 'chase/Vim-Jinja2-Syntax', {'for': ['html', 'jinja']} "jinja2 syntax...
Plug 'mattn/emmet-vim', {'for': ['html', 'jinja', 'javascript']} "ZenCoding pour html/css must read => emmet.io

Plug 'ntpeters/vim-better-whitespace' "Pour virer les espace vide. :StripWhitespace
Plug 'Valloric/MatchTagAlways' "Matching des ()[]{} inteligent
Plug 'tpope/vim-abolish' ":%s mais bien plus cool et pour programmeur... :Subvert
Plug 'tpope/vim-surround' "pour du script-fu  select intelligent dans les ()[]{}
Plug 'tpope/vim-repeat' "la commande . surbooster
Plug 'tpope/vim-commentary' " Commenter une ligne: gcc

Plug 'w0rp/ale' "CheckStyle modern
Plug 'Lokaltog/vim-easymotion' "Recherche dans le text très avancé :)
Plug 'chaoren/vim-wordmotion'

Plug 'dpell/vim-Grammalecte'

Plug 'mhinz/vim-signify'

Plug 'davidhalter/jedi'
Plug 'davidhalter/jedi-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'zchee/deoplete-jedi'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'tpope/vim-eunuch' " :SudoWrite !!!!!! \o/
Plug 'jimsei/winresizer' " pour la gestion des fenètres
" COLO {{
"Plug 'whatyouhide/vim-gotham'
"Plug 'rafi/awesome-vim-colorschemes'
"Plug 'mhinz/vim-janah'
Plug 'arcticicestudio/nord-vim'
"Plug 'archseer/colibri.vim'
"Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep'}
"Plug 'jnurmine/Zenburn' " ma colo préféré
"}}

Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'ap/vim-css-color' " colorations des #FFFFFF et rgba(0,2,3) dans les fichiers!
Plug 'tweekmonster/braceless.vim' "Gestion des indents dans python et autres languages sans {}


Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim' "Une status line qui rocks et qui pulse


Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

Plug 'terryma/vim-multiple-cursors'
call plug#end()   "vundle load plugin

syntax on
colorscheme nord

set number         "Line number!


"TABS!
set expandtab " Transforme les tab en espace
set tabstop=4
set shiftwidth=4
set shiftround

"Minibuffer line
set noshowmode
set showcmd
set cursorline
set showmatch

"search options
set ignorecase " ignore la case
set smartcase " mais la supporte si explicitement demandé

"popup motions
set wildmode=longest,list,full
set completeopt=menu,menuone,longest

" Indent
set smartindent
nmap <F8> :TagbarToggle<CR>

"comfort
set undolevels=1000
set clipboard+=unnamed
set matchpairs+=<:>
set foldlevelstart=99

set mouse=a
set pastetoggle=<F2>
set autoread

" Warp des lignes
set wrap
set linebreak
set breakindent
set showbreak==>


set fileformats=unix,dos,mac
set shell=/bin/sh

" IndentLine
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '┆'
let g:indentLine_faster = 1


" html
" for html files, 2 spaces
autocmd Filetype html setlocal ts=2 sw=2 expandtab

" Resize des split screen!
autocmd VimResized * :wincmd =

set hidden
" Deoplete
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" jedi-vim
let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "0"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#smart_auto_mappings = 0
let g:jedi#completions_enabled=0

"Easy-motion
let g:EasyMotion_do_mapping = 0
nmap s <Plug>(easymotion-s)
xmap s <Plug>(easymotion-s)
omap s <Plug>(easymotion-s)

map f <Plug>(easymotion-bd-f)
nmap F <Plug>(easymotion-overwin-f)

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

"FZF
nmap <Leader><Leader> :FZF<CR>

"Column size
set cc=80
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Emmet
" -----
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key='<C-Space>'
autocmd Filetype html,css,jinja EmmetInstall

" Ropevim
" -------
let g:ropevim_guess_project = 1

" Braceless
" ---------
autocmd FileType python BracelessEnable +indent +highlight

" Cross highlight html + jinja + javascript
let g:jinja_syntax_html=1
let javascript_enable_domhtmlcss = 1

" Coloration des .tag riotjs
au BufNewFile,BufRead *.tag setlocal ft=html

"Light line
let g:lightline = { 'colorscheme': 'nord' }

"Signify
let g:signify_vcs_list = [ 'hg', 'git' ]

" Config python nvim
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'
let g:python_higlight_all = 1

" ALE
let g:ale_python_pylint_change_directory=0
let g:ale_linters = { 'python': ['pylint', 'mypy'] }
let g:ale_echo_msg_error_str = '❌'
let g:ale_echo_msg_warning_str = '⚠️'
let g:ale_echo_msg_format = '%severity% %s [%linter%][%code%]'

" Highlight {{{
highlight Comment gui=italic
highlight Comment cterm=italic
highlight htmlArg gui=italic
highlight htmlArg cterm=italic
highlight xmlAttrib cterm=italic
highlight xmlAttrib gui=italic
highlight Type cterm=italic
highlight Type gui=italic
highlight Normal ctermbg=none
" }}}

nnoremap <leader>ev :vs $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" vim:set foldmethod=marker foldlevel=0
