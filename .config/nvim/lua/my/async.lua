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

-- vim.opt.makeprg = './build.sh -j 18 -m Debug --no-test'
vim.api.nvim_create_user_command('M', function(args) AsyncStart(vim.api.nvim_get_option("makeprg"), args.args) end, {nargs = '*'})
