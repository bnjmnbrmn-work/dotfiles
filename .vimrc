" Mostly taken from https://gist.github.com/gosukiwi/080d1d3f87f861a15c44

" ---------------------- USABILITY CONFIGURATION ----------------------
"0,  Basic and pretty much needed settings to provide a solid base for
"  source code editting

" don't make vim compatible with vi 
set nocompatible

set t_Co=256
" turn on syntax highlighting
syntax on
" and show line numbers
set number

set background=dark
colorscheme distinguished

" make vim try to detect file types and load plugins for them
filetype on
filetype plugin on
filetype indent on

set showcmd
set ignorecase
set smartcase
set nostartofline
set confirm
set mouse=a
hi MatchParen cterm=bold ctermbg=none ctermfg=blue

" reload files changed outside vim
set autoread

" encoding is utf 8
set encoding=utf-8
set fileencoding=utf-8
scriptencoding utf-8


" enable matchit plugin which ships with vim and greatly enhances '%'
runtime macros/matchit.vim


" by default, in insert mode backspace won't delete over line breaks, or 
" automatically-inserted indentation, let's change that
set backspace=indent,eol,start

" dont't unload buffers when they are abandoned, instead stay in the
" background
set hidden

" set unix line endings
set fileformat=unix
" when reading files try unix line endings then dos, also use unix for new
" buffers
set fileformats=unix,dos

" save up to 100 marks, enable capital marks
set viminfo='100,f1

" screen will not be redrawn while running macros, registers or other
" non-typed comments
set lazyredraw

" ---------------------- CUSTOMIZATION ----------------------
"  The following are some extra mappings/configs to enhance my personal
"  VIM experience


" set , as mapleader
let mapleader = ","

" map <leader>q and <leader>w to buffer prev/next buffer
" nnoremap <leader>q :bp<CR>
" nnoremap <leader>q :bp<CR>

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>

" windows like clipboard
" yank to and paste from the clipboard without prepending "* to commands
let &clipboard = has('unnamedplus') ? 'unnamedplus' : 'unnamed'
vnoremap <c-s-x> "+x
vnoremap <c-s-c> "+y
cno <c-s-v> <c-r>+
"exe 'ino <script> <c-s-v>' paste#paste_cmd['i']

vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" search settings
set incsearch " find the next match as we type the search
set hlsearch " highlight searches by default
" use ESC to remove search highlight
" This, below, seems to make you delete the first line in the file when you
" open it
"nnoremap <esc> :noh<return><esc>

set wildmode=list:longest

" keep the cursor visible within 3 lines when scrolling
set scrolloff=3

" indentation
set expandtab
set autoindent
set smartindent
set shiftwidth=2
set softtabstop=2
set tabstop=2

" when pasting over SSH it's a pain to type :set paste and :set nopaste
" just map it to <f9>
set pastetoggle=<f9>

" select all mapping
noremap <leader>a ggVG

inoremap <C-l> <right>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-h> <left>
inoremap <C-c> <CR><Esc>O
set history=200
" ---------------------- PLUGIN CONFIGURATION ----------------------

set nocompatible
filetype off

" initiate Vundle
"let &runtimepath.=',$HOME/.vim/bundle/Vundle.vim'
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
"Plugin 'gmarik/Vundle.vim'
Plugin 'VundleVim/Vundle.vim'

"Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/nerdtree'
"Plugin 'tpope/vim-vinegar'
"Plugin 'vim-scripts/l9'
"Plugin 'vim-scripts/fuzzyfinder'
"Plugin 'wincent/command-t'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'lokaltog/vim-easymotion'
Plugin 'tpope/vim-surround'
Plugin 'qpkorr/vim-bufkill' "This seems to be causing problems for command-t
"<leader>b
"Plugin 'cespare/vim-sbd'
Plugin 'tpope/vim-repeat'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-ragtag'
"Plugin 'jistr/vim-nerdtree-tabs'
"Plugin 'itchyny/lightline.vim'
"Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'

" -- Web Development
"Plugin 'mattn/emmet-vim'
"Plugin 'skammer/vim-css-color' "This makes opening html/css files really slow
"and doesn't seem to be working
"Plugin 'hail2u/vim-css3-syntax' 

" -- JavaScript
"Plugin 'jelera/vim-javascript-syntax'
"Plugin 'pangloss/vim-javascript'
"Plugin 'nathanaelkane/vim-indent-guides'
"Plugin 'Raimondi/delimitMate'
"Plugin 'scrooloose/syntastic'
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 0
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_javascript_checkers = ['jshint']
"let g:syntastic_java_checkers=[]

"Plugin 'Valloric/YouCompleteMe'
"let g:ycm_add_preview_to_completeopt=0
"let g:ycm_confirm_extra_conf=0
"set completeopt-=preview
"Plugin 'ternjs/tern_for_vim'
"Plugin 'flowtype/vim-flow'

" end plugin definition
call vundle#end()  " required for vundle

filetype plugin indent on

"set omnifunc=syntaxcomplete#Complete
"set completeopt=longest,menuone

"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
"  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
"inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
"  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
"inoremap <expr> <C-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
  \ '<C-x><C-o><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'"'
"inoremap <expr> <S-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
"  \ '<C-x><C-u><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'"'

" start NERDTree on start-up and focus active window
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p

noremap <F3> :NERDTreeToggle<CR>



" map FuzzyFinder
"noremap <leader>b :FufBuffer<cr>
"noremap <leader>f :FufFile<cr>

" use zencoding with <C-E> (default is <C-Y>)
"let g:user_emmet_leader_key = '<c-e>'

" fix issue with lightline
"set laststatus=2

"nnoremap <silent> <leader>b :CommandTMRU<CR>

"let g:UltiSnipsExpandTrigger="<c-e>"
"let g:UltiSnipsJumpForwardTrigger="<c-f>"
"let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

nnoremap <leader>q :bp<cr>:bd #<cr>

"let g:tern_map_keys=1
"let g:tern_map_prefix='<leader>'

"au BufRead,BufNewFile .tern-project setfiletype json
