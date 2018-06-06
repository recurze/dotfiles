set nocompatible
filetype plugin indent on
syntax on


set ts=4 et ai si ci sw=4 sta
set backspace=indent,eol,start
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<
set nu ls=2 list is
set ar hlsearch ic mh
set sc smd sm scs
set history=2000 ul=100 scrolloff=5
set tf lazyredraw
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

