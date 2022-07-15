set encoding=utf-8
set nocompatible

syntax on
filetype plugin indent on

set autoread

set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

set hidden
set backspace=indent,eol,start

set history=200
set textwidth=80
set wrap
set ruler
set wildmenu

set hlsearch
set incsearch

set ttimeout
set ttimeoutlen=100

set ttyfast
set lazyredraw

set splitbelow
set splitright

set list
set listchars=tab:»·,trail:~,extends:>,precedes:<

nmap <up>    :3wincmd +<CR>
nmap <down>  :3wincmd -<CR>
nmap <left>  :3wincmd <<CR>
nmap <right> :3wincmd ><CR>

nnoremap Q @q
nnoremap j gj
nnoremap k gk

imap <Tab> <C-n>
inoremap {<CR> {<CR>}<Esc>O

vnoremap ( c()<ESC>Pf)
vnoremap { c{}<ESC>Pf)
vnoremap " c""<ESC>Pf)
vnoremap ' c''<ESC>Pf)

set number
highlight LineNr ctermfg=Gray
"highlight CursorLineNr ctermfg=Red ctermbg=Black

augroup vimStartup
    au!
    autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
    \ |   exe "normal! g`\""
    \ | endif
augroup END

augroup vimrcEx
    au!
    autocmd FileType text setlocal tw=72
augroup END

augroup auFileTypes
    autocmd!
    autocmd FileType markdown setlocal tw=80
augroup END

set directory=$HOME/.vim/swapfiles//
if has("vms")
    set nobackup
else
    set backup
    set backupdir=~/.vim/backupfiles//
    if has('persistent_undo')
        set undofile
        set undodir=~/.vim/undofiles//
    endif
endif

nnoremap <silent> <F5> :w<CR>:!md % > %<.html<CR><CR>

function! Grep(...)
    let l:opt = a:0 == 3 ? a:1 : ''
    let l:pat = a:0 == 3 ? a:2 : a:0 == 0 ? @/ : a:1
    let l:files = a:0 == 3 ? a:3 : a:0 == 2 ? a:2 : ''
    let l:cmd = 'silent! grep! ' . l:opt . ' "' . l:pat . '" `git ls-files ' . l:files . '`'
    execute l:cmd | redraw! | copen
endfunction
command! -nargs=* Grep call Grep(<f-args>)

nnoremap [q :cprev<CR>
nnoremap ]q :cnext<CR>

function! QFMapping()
    let maplocalleader='\'
    nnoremap <buffer> <Tab> <CR>zz<C-w>w
    nnoremap <buffer> <LocalLeader>w :cgetbuffer<CR>
endfunction

augroup qf_group
    au!
    autocmd BufReadPost quickfix set modifiable
    autocmd FileType qf call QFMapping()
augroup END

cnoremap <C-g> <C-r>"
"autocmd BufWinLeave *.* mkview
"autocmd BufWinEnter *.* silent loadview
"inoremap jj <Esc>/<++><CR><Esc>cf>
"inoremap ( ()<++><Esc>4hi
"inoremap [ []<++><Esc>4hi
"inoremap { {}<++><Esc>4hi
"
"inoremap ;f for (<++>; <++>; <++>) {<CR><++><CR>}<Esc>2kf<cf>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-j': 'split',
  \ 'ctrl-l': 'vsplit' }

command! -bang -complete=dir -nargs=? Files
    \ call fzf#run(fzf#wrap({'source': 'git ls-files', 'dir': <q-args>}, <bang>0))
