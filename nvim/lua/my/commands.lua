vim.cmd('cabbr vf vert sf')
vim.cmd('cabbr vb vert sb')

-- Switch to file with same basename but different extension
vim.cmd('cabbr E e %<')
vim.cmd('cabbr V vs %<')

vim.keymap.set('n', ' f', ':GFiles<CR>') -- uses dir of %, not pwd
vim.keymap.set('n', ' a', ':Files<CR>')
-- Other useful fzf commands: Commits, BCommits

vim.api.nvim_create_user_command('Blame', ':vne | r !git blame #', {})

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

-- Async; inspired by https://gist.github.com/phelipetls/639a1b5f021d17c4124cccc83e518566
_G.job_id = 0
function AsyncStart(job, args)
    if _G.job_id ~= 0 then
        print("One at a time please")
        return
    end

    args = args or ""

    -- Store stdout and stderr to setqflist
    local lines = {}
    local cmd = vim.fn.expandcmd(job .. ' ' .. args)

    local function on_event(job_id, data, event)
        if event == "stdout" or event == "stderr" then
            if data then
                vim.list_extend(lines, data)
            end
        end

        if event == "exit" then
            lines = vim.tbl_filter(function(s) return s ~= "" end, lines)
            vim.fn.setqflist({}, " ", {
                title = cmd,
                lines = lines,
            })
            _G.job_id = 0
            vim.api.nvim_command("doautocmd QuickFixCmdPost")
        end
    end

    _G.job_id = vim.fn.jobstart(cmd, {
        on_stderr = on_event,
        on_stdout = on_event,
        on_exit = on_event,
        stdout_buffered = true,
        stderr_buffered = true,
    })
end

vim.api.nvim_create_user_command('AsyncStop', function() vim.fn.jobstop(_G.job_id); _G.job_id = 0 end, {})

vim.opt.makeprg = './build.sh -j 18 -m Debug --no-test'
vim.api.nvim_create_user_command('M', function(args) AsyncStart(vim.api.nvim_get_option("makeprg"), args.args) end, {nargs = '*'})
