-- Indentation
local indent = 4;
vim.opt.expandtab = true
vim.opt.tabstop=indent
vim.opt.shiftwidth=indent

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.list = true
vim.opt.listchars = { tab = '»·', trail = '~', extends = '>', precedes = '<' }

vim.opt.path = {'.', ''} -- find files using fzf instead
vim.opt.wrap = true
vim.opt.relativenumber = true
vim.opt.lazyredraw = true

vim.opt.shortmess = "atTIcCS"
vim.opt.ruler = false

vim.opt.clipboard = "unnamedplus"

vim.opt.mouse = ""
vim.opt.completeopt = { "menuone", "longest" }

-- Disable folding at startup
vim.opt.foldenable = false
-- Set foldmethod/expr in fold.lua

-- We have git
vim.opt.swapfile = false
-- But just in case
vim.opt.backup = true

local HOME = os.getenv("HOME")
vim.opt.backupdir = HOME .. '/.vim/backupfiles//'
if vim.fn.has('persistent_undo') then
    vim.opt.undofile = true
    vim.opt.undodir = HOME .. '/.vim/undofiles//'
end
