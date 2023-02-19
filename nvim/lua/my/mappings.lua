function map(mode, lhs, rhs, options)
    options = options or {}
    vim.keymap.set(mode, lhs, rhs, options)
end

-- Resize windows with arrow keys
map('n', '<up>',    ':3wincmd +<CR>')
map('n', '<down>',  ':3wincmd -<CR>')
map('n', '<left>',  ':3wincmd <<CR>')
map('n', '<right>', ':3wincmd ><CR>')

-- Quit with C-c
map('n', '<C-c>', ':qa<CR>')

-- Cycle through buffers
map('n', '<C-p>', ':bp<CR>')
map('n', '<C-n>', ':bn<CR>')

-- Rearrange tabs
map('n', '<C-Right>', ':tabm +1<CR>')
map('n', '<C-Left>', ' :tabm -1<CR>')

-- Cycle through quickfix items and tags
map('n', '[q', ':cprev<CR>')
map('n', ']q', ':cnext<CR>')
map('n', '[t', ':tprevious<CR>')
map('n', ']t', ':tnext<CR>')

map('n', 'Q', '@q')
map('n', 'j', 'gj')
map('n', 'k', 'gk')

-- Cycle through tabs
map('n', 'th', ':tabp<CR>')
map('n', 'tl', ':tabn<CR>')
map('n', 't0', ':tabl<CR>')
map('n', 't1', ':tabfirst<CR>')

map('i', '{<CR>', '{<CR>}<Esc>O')
-- See tab completion in commands.lua

-- surround selected area
map('v', '(', 'c()<Esc>Pf)')
map('v', '{', 'c{}<Esc>Pf}')
map('v', '\'', 'c\'\'<Esc>Pf)')
map('v', '"', 'c""<Esc>Pf)')

map('c', '<C-g>', '<C-r>"')
