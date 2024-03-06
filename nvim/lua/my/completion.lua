function FallbackTab()
    return vim.fn.pumvisible() == 1 and '' or vim.api.nvim_replace_termcodes('<C-X><C-I>', true, true, true)
end

-- Clever Tab
vim.keymap.set('i', '<Tab>',
    function()
        if vim.fn.pumvisible() == 1 then
            -- Pop up menu visible; cycle through the options
            return '<C-N>'
        end

        local str = vim.api.nvim_get_current_line()
        local col = vim.api.nvim_win_get_cursor(0)[2]
        local prv_chr = str:sub(col, col)
        if (col == 0 or prv_chr:match('%s')) then
            -- Prev char was space; don't complete
            return '<Tab>'
        end
        if prv_chr:match('/') then
            -- Complete file name
            return '<C-X><C-F>'
        elseif vim.api.nvim_buf_get_option(0, 'omnifunc') ~= '' then
            -- Trigger omnifunc (hopefully by lsp) or fallback
            return '<C-X><C-O><C-R>=v:lua.FallbackTab()<CR>'
        else
            -- Complete words from current buffer and included files
            return '<C-X><C-I>'
        end
    end,
    {expr = true}
)


