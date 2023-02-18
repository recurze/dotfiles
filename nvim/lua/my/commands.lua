-- Git Grep
vim.opt.grepprg = 'git grep -I --line-number'
vim.api.nvim_create_user_command('G',
    'silent! grep! <args> | redraw!',
    {nargs = '*', complete = 'dir'}
)
vim.api.nvim_create_user_command('Gg',
    'silent! grep! <cword> | redraw!',
    {nargs = '*', complete = 'dir'}
)

-- Make
vim.opt.makeprg = './build.sh -j 18 -m Debug --no0test'
vim.api.nvim_create_user_command('M',
    'silent! make! <args> | redraw!',
    {nargs = '*'}
)

-- wget https://raw.githubusercontent.com/junegunn/fzf/master/plugin/fzf.vim -O ~/.config/nvim/autoload/fzf.vim
vim.api.nvim_create_user_command('F',
    "call fzf#run(fzf#wrap({'source': 'git ls-files', 'dir': <q-args>}, <bang>0))",
    {nargs = '?', bang = true}
)

vim.api.nvim_create_user_command('Fa',
    "call fzf#run(fzf#wrap({'source': 'find', 'dir': <q-args>}, <bang>0))",
    {nargs = '?', bang = true}
)

vim.cmd([[
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
]])
