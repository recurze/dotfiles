-- wget https://raw.githubusercontent.com/savq/paq-nvim/master/lua/paq.lua -O ~/.config/nvim/lua/paq.lua
require "paq" {
    { 'nvim-treesitter/nvim-treesitter', run = function() vim.cmd('TSUpdate') end },
    { 'nvim-treesitter/nvim-treesitter-textobjects' },
    { 'neovim/nvim-lspconfig' },
    { 'junegunn/fzf', run = function() vim.fn['fzf#install']() end },
    { 'junegunn/fzf.vim' },
}
