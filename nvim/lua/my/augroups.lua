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


function LatexStuff()
    vim.opt.foldmethod = 'expr'
    vim.opt.foldexpr = 'vimtex#fold#level(v:lnum)'
    vim.opt.foldtext = 'vimtex#fold#text()'
end

local latex = vim.api.nvim_create_augroup('latex', { clear = true })
vim.api.nvim_create_autocmd({'FileType'}, {
  pattern = 'tex',
  group = latex,
  callback = function() LatexStuff() end,
})
