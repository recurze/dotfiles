set autoindent
filetype plugin indent on
syntax on

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set sta

set backspace=indent,eol,start

set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<
set list

set number
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

set history=2000 ul=100 scrolloff=5
set ttyfast
set lazyredraw
set wildmenu
ret

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

inoremap {<CR> {<CR>}<Esc>O
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap jk <Esc>
imap <Tab> <C-p>

