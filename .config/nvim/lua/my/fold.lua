-- Why? Multi-line function signatures and template C++. So my own logic.
--
-- Notice inconsistencies in indexing:
-- Fold(lnum) and nvim_buf_get_lines is 0-indexed, indent and ipairs is 1-indexed.

function IsBlankLine(line)
    return line:match("^%s*$")
end

function PrevNonBlankLine(lnum)
    local buflines = vim.api.nvim_buf_get_lines(0, 0, lnum, true)
    local last = -2
    for num, line in ipairs(buflines) do
        if not IsBlankLine(line) then
            -- num is 1-indexed but lnum 0
            last = num - 1
        end
    end
    return last
end

function NextNonBlankLine(lnum)
    local buflines = vim.api.nvim_buf_get_lines(0, lnum + 1, -1, true)
    for num, line in ipairs(buflines) do
        if not IsBlankLine(line) then
            return num + lnum
        end
    end
    return -2
end

function IndentLevel(lnum)
    if lnum == -2 then
        return 100
    end
    -- indent is 1-indexed
    return vim.fn.indent(lnum + 1) / vim.api.nvim_get_option("shiftwidth")
end

function Fold(lnum)
    -- 0-indexed lnum
    local this_indent = IndentLevel(lnum)
    local next_indent = IndentLevel(NextNonBlankLine(lnum))
    local prev_indent = IndentLevel(PrevNonBlankLine(lnum))

    -- don't worry, just one line
    local buflines = vim.api.nvim_buf_get_lines(0, lnum, lnum + 1, true)
    for num, line in ipairs(buflines) do
        if IsBlankLine(line) then
            if prev_indent == next_indent then
                return prev_indent
            else
                return -1
            end
        end
    end

    if this_indent > prev_indent + 1 or this_indent == prev_indent then
        -- wish I could remove this '=' (as suggested by :help fold-expr)
        return '='
    end
    return this_indent
end

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.Fold(v:lnum - 1)'
-- vim.opt.foldexpr = 'nvim_treesitter#foldexpr()' -- not recommended

-- vim.opt.foldlevel = 2
-- vim.opt.foldmethod = 'indent'
