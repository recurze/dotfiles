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

-- Cycle through tags
map('n', 'th', ':tabp<CR>')
map('n', 'tl', ':tabn<CR>')
map('n', 't0', ':tabl<CR>')
map('n', 't1', ':tabfirst<CR>')

map('i', '{<CR>', '{<CR>}<Esc>O')
map('i', '<Tab>',
    function()
        local str = vim.api.nvim_get_current_line()
        local col = vim.api.nvim_win_get_cursor(0)[2]
        if (col == 0 or str:sub(col, col):match('%s')) then
            -- Prev char was space; don't complete
            return '<Tab>'
        elseif vim.fn.pumvisible() == 1 then
            -- Pop up menu visible, cycle through the options
            return '<C-N>'
        else
            -- Trigger omnifunc (should be provided by lsp)
            -- Option for other <C-X> completions ?
            return '<C-X><C-O>'
        end
    end,
    { expr = true }
)

-- surround selected area
map('v', '(', 'c()<Esc>Pf)')
map('v', '{', 'c{}<Esc>Pf}')
map('v', '\'', 'c\'\'<Esc>Pf)')
map('v', '"', 'c""<Esc>Pf)')

map('c', '<C-g>', '<C-r>"')
