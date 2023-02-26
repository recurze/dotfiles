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

-- My precious screen estate
vim.opt.cmdheight = 0
vim.opt.ruler = false

vim.opt.mouse = ""
vim.opt.completeopt = { "menuone", "longest" }

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