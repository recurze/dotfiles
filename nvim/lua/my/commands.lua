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
            -- Trigger omnifunc (hopefully by lsp)
            return '<C-X><C-O>'
        else
            -- Complete words from current buffer and included files
            return '<C-X><C-I>'
        end
    end,
    {expr = true}
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

-- too lazy to figure out lua for this
vim.cmd([[
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
]])

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
