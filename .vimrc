" colorscheme Tomorrow-Night
set background=dark

set autoindent
set wrap

filetype plugin indent on
syntax enable

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set sta

set backspace=indent,eol,start

set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<
set list

set number
set relativenumber
set laststatus=2
set incsearch
set autoread
set hlsearch 
set ignorecase
set mousehide
set showmode
set showmatch
set smartcase
set showcmd

set ruler


set history=2000 ul=100 scrolloff=5
set ttyfast
set lazyredraw
set wildmenu
ret

set wrap
set linebreak

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l


nmap <left>  :3wincmd <<cr>
nmap <right> :3wincmd ><cr>
nmap <up>    :3wincmd +<cr>
nmap <down>  :3wincmd -<cr>

nnoremap Q @q
nnoremap ; :
nnoremap 0 ^
nnoremap j gj
nnoremap k gk

inoremap {<CR> {<CR>}<Esc>O
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
inoremap jk <Esc>
imap <Tab> <C-p>

set cursorline
hi clear CursorLine
hi CursorLineNR ctermbg=DarkGray
