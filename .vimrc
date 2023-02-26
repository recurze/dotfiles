" mkdir -p ~/.vim/{autoload,undo,colors}
unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

"""""""""""""""""""""""""""""""""options""""""""""""""""""""""""""""""""

" wget https://raw.githubusercontent.com/mhartington/oceanic-next/master/colors/OceanicNext.vim -O ~/.vim/colors/OceanicNext.vim
colorscheme OceanicNext

" Indenting
set autoindent
set smartindent
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Folding
set foldmethod=syntax
set foldminlines=3
set foldlevel=2

" Buffers
set autoread
set hidden
set splitbelow
set splitright

" Display
set laststatus=2
set lazyredraw
set list
set listchars=tab:»·,trail:~,extends:>,precedes:<
set relativenumber
set shortmess=atITcC

" No need for backup and swap: we have git
set nobackup
set noswapfile
set undodir=~/.vim/undo//
set undofile

" Misc
set shell=/bin/bash
set path=.,,
set hlsearch
set matchpairs+=<:>
set completeopt=menuone,longest

"""""""""""""""""""""""""""""""""mappings"""""""""""""""""""""""""""""""

" Resize windows
nnoremap <up>    :3wincmd +<CR>
nnoremap <down>  :3wincmd -<CR>
nnoremap <left>  :3wincmd <<CR>
nnoremap <right> :3wincmd ><CR>

" Rearrange tabs
nnoremap <C-left>  :tabm -1<CR>
nnoremap <C-right> :tabm +1<CR>

" Cycle through buffers
nnoremap <C-p> :bp<CR>
nnoremap <C-n> :bn<CR>

" Cycle through quickfix items
nnoremap [q :cprev<CR>
nnoremap ]q :cnext<CR>

" Cycle through tags
nnoremap [t :tprevious<CR>
nnoremap ]t :tnext<CR>

" Cycle through tabs
nnoremap th :tabp<CR>
nnoremap tl :tabn<CR>
nnoremap t0 :tabl<CR>
nnoremap t1 :tabfirst<CR>

" Misc normal
nnoremap <C-c> :qa<CR>
nnoremap Q @q
nnoremap j gj
nnoremap k gk

" Surround
vnoremap ( c()<ESC>Pf)
vnoremap { c{}<ESC>Pf)
vnoremap " c""<ESC>Pf)
vnoremap ' c''<ESC>Pf)

inoremap {<CR> {<CR>}<ESC>O

"""""""""""""""""""""""""""""""""augroups"""""""""""""""""""""""""""""""

function! QFMapping()
    nnoremap <buffer> <Tab> <CR>zz<C-w>w
    nnoremap <buffer> \w :cgetbuffer<CR>
endfunction

augroup qf_group
    au!
    autocmd QuickFixCmdPost [^l]* copen | set modifiable
    autocmd VimEnter * cwindow | set modifiable

    autocmd BufReadPost quickfix set modifiable
    autocmd FileType qf call QFMapping()

    set efm+=%f\|%l\ col\ %c\|%m
augroup END

"""""""""""""""""""""""""""""""""plugins""""""""""""""""""""""""""""""""

" wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -O ~/.vim/autoload/plug.vim

call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

cabbr F GFiles
cabbr Fa Files
" Note: GFiles uses dir of the file, not :pwd
" Other useful commands: Commits, BCommits (buffer)

"""""""""""""""""""""""""""""""""commands"""""""""""""""""""""""""""""""

cabbr E e %<
cabbr V vs %<
cabbr vf vert sf
cabbr vb vert sb

command! Blame :vne | r !git blame #

set grepprg=git\ grep\ -I\ --line-number
command! -complete=dir -nargs=* G silent! grep! <args> | redraw!
command! -complete=dir -nargs=* Gg silent! grep! <cword> | redraw!

set makeprg=./build.sh\ -j\ 18\ -m\ Debug\ --no-test
" TODO: make async
command! -nargs=* M silent! make! <args> | redraw!

function! FuzzyComplete()
    let l:items = complete_info().items
    if len(l:items) < 25
        return ''
    endif
    return fzf#vim#complete(fzf#wrap({'source': map(l:items, "v:val.word")}))
endfunction

let s:complete_method = 0
function! TabComplete()
    if pumvisible()
        let s:complete_method = 0
        return ''
    endif
    if s:complete_method == 0
        let s:complete_method = 1
        if &omnifunc != ''
            return "\<C-x>\<C-o>"
        endif
    elseif s:complete_method == 1
        let s:complete_method = 2
        if len(tagfiles()) > 0
            return "\<C-x>\<C-]>"
        endif
    elseif s:complete_method == 2
        let s:complete_method = 0
        " C-e to exit C-x mode
        return "\<C-e>\<C-n>"
        " :help 'complete'
    endif
    return ''
endfunction

function! Tab()
    if pumvisible()
        return "\<C-n>"
    elseif strpart(getline("."), col(".") - 1, 1, v:true) == '/'
        return "\<C-x>\<C-f>"
    endif
    return TabComplete()
endfunction

imap <silent> <Tab> <C-r>=Tab()<CR><C-r>=TabComplete()<CR><C-r>=TabComplete()<CR><C-r>=FuzzyComplete()<CR>


" Universal Ctags command:
" See gen_ctags in ~/.bash_sqpt

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Guide:
"
"  * Heirarchy: tabs > windows > buffers
"  * Creation:
"      - tab    : :tabe
"      - window : :sp, :vs
"      - buffers: :bad <file>
"  * Kill:
"      - tab    : :tabc
"      - window : :q
"      - buffers: :bd, :bdN
"  * Movement:
"      - tab    : :tabn, :tabp, gt, gT, Ngt, :tabn N
"      - window : <C-w> hjkl
"      - buffers: :bn, :bp, :b <file>, :bN, :Nb, <C-^>
"  * Rearrange:
"      - tab    : :tabm
"      - window : <C-w> HJKL
"      - buffers: <navigate to win> :e
"
"  * netrw:
"      - open browser: :Lex, :Tex, :Rex (return)
"      - navi        : <c-r>, - (up), u (prev visited), U (subs visited)
"      - open files  : o (h down), v (v right), p (preview up), P (last window), t (new tab)
"      - file opers  : % (create file), d (create dir), D (del dir), R (rename dir)
"      - maps, bookmarks: TODO
"  * TODO: marks, registers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
