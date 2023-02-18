function seek_last_cursor_pos()
    vim.cmd([[ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit' | exe "normal! g`\"" | endif ]]);
end

local startup = vim.api.nvim_create_augroup('startup', { clear = true })
vim.api.nvim_create_autocmd({'BufReadPost'}, {
  pattern = '*',
  group = startup,
  callback = function() seek_last_cursor_pos() end,
})

local filetypes = vim.api.nvim_create_augroup('filetypes', { clear = true })
vim.api.nvim_create_autocmd({'BufReadPost'}, {
  pattern = {'text', 'markdown'},
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
  command = 'copen | set modifiable',
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
