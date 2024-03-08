local filetypes = vim.api.nvim_create_augroup('filetypes', { clear = true })
vim.api.nvim_create_autocmd({'BufReadPost'}, {
  pattern = {'*.txt', '*.md', '*.tex'},
  group = filetypes,
  command = 'setlocal textwidth=120',
})


-- Quickfix window AU
function QFMappings()
    vim.api.nvim_buf_set_keymap(0, 'n', '<Tab>', '<CR>zz<C-w>w', { noremap = true })
    vim.api.nvim_buf_set_keymap(0, 'n', '\\w', ':cgetbuffer<CR>', { noremap = true })
end

local quickfix = vim.api.nvim_create_augroup('qf', { clear = true })
vim.api.nvim_create_autocmd({'VimEnter'}, {
  pattern = '*',
  group = quickfix,
  command = 'cwindow | set modifiable',
})
vim.api.nvim_create_autocmd({'QuickFixCmdPost'}, {
  pattern = '[^l]*',
  group = quickfix,
  command = 'cwindow | set modifiable',
})
vim.api.nvim_create_autocmd({'BufReadPost'}, {
  pattern = 'quickfix',
  group = quickfix,
  command = 'set modifiable',
})
vim.api.nvim_create_autocmd({'FileType'}, {
  pattern = 'qf',
  group = quickfix,
  callback = function() QFMappings() end,
})


function LatexMappings()
    -- close environments
    vim.api.nvim_buf_set_keymap(0, 'i', '}e', '}<Esc>yyplcwend<Esc>O', { noremap = true })

    -- override completion to simply use keywords from current file
    vim.keymap.set('i', '<Tab>',
        function()
            if vim.fn.pumvisible() == 1 then
                -- Pop up menu visible; cycle through the options
                return '<C-N>'
            end
            return '<C-X><C-N>'
        end,
        { noremap = true, buffer = true, expr = true }
    )
end

local latex = vim.api.nvim_create_augroup('latex', { clear = true })
vim.api.nvim_create_autocmd({'FileType'}, {
  pattern = 'tex',
  group = latex,
  callback = function() LatexMappings() end,
})
