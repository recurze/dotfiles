" colorscheme Tomorrow-Night
set background=dark

set autoindent
set wrap

filetype plugin indent on
filetype indent on
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
set relativenumber
set laststatus=2
set incsearch
set autoread
set hlsearch
""set ignorecase
""set mousehide
""set showmode
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

set nrformats=

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l


nmap <left>  :3wincmd <<cr>
nmap <right> :3wincmd ><cr>
nmap <up>    :3wincmd +<cr>
nmap <down>  :3wincmd -<cr>

nnoremap Q @q
"noremap ; :
nnoremap 0 ^
nnoremap j gj
nnoremap k gk
nnoremap t :NERDTree<CR>
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
nnoremap <silent> <F9> :w <CR> :make %<<CR>
nnoremap <silent> <F8> :w <CR> :make %<<CR> :!./%<

inoremap {<CR> {<CR>}<Esc>O
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
inoremap jk <Esc>
imap <Tab> <C-p>

" Surround with
vnoremap ( c(<Esc>pi)<Esc>
vnoremap { c{<Esc>pi}<Esc>
vnoremap " c"<Esc>pi"<Esc>
vnoremap ' c'<Esc>pi'<Esc>

" For latex
vnoremap <C-b> c\textbf{<Esc>pi}<Esc>
vnoremap <C-i> c\emph{<Esc>pi}<Esc>

set cursorline
hi clear CursorLine
hi CursorLineNR ctermbg=DarkGray

let g:header_auto_add_header=0
let g:header_field_author='recurze'
map <F4> :AddHeader<CR>

let g:tex_flavor = 'pdflatex'

let $CXX="g++"
let $CXXFLAGS='-std=c++14 -Wall -Wextra -Wconversion'
set efm^=%-G%f:%l:\ warning:%m
set efm^=%-G%f:%l:\ make*:%m

set colorcolumn=81
highlight ColorColumn ctermbg=DarkGray

let NERDTreeShowLineNumbers=1
