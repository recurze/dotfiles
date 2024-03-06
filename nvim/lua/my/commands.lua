vim.cmd('cabbr vf vert sf')
vim.cmd('cabbr vb vert sb')

-- Switch to file with same basename but different extension
vim.cmd('cabbr E e %<')
vim.cmd('cabbr V vs %<')

vim.keymap.set('n', ' f', ':GFiles<CR>') -- uses dir of %, not pwd
vim.keymap.set('n', ' a', ':Files<CR>')
-- Other useful fzf commands: Commits, BCommits

vim.api.nvim_create_user_command('Blame', ':vne | r !git blame #', {})

-- Git Grep is fast enough to not require Async
vim.opt.grepprg = 'git grep -I --line-number'
vim.api.nvim_create_user_command('G',
    'silent! grep! <args> | redraw!',
    {nargs = '*', complete = 'dir'}
)
vim.api.nvim_create_user_command('Gg',
    'silent! grep! <cword> | redraw!',
    {nargs = '*', complete = 'dir'}
)
vim.keymap.set('n', ' g', ':Gg<CR>')

require('my.completion')
require('my.async')
require('my.fold')
