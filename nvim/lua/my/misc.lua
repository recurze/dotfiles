-- wget https://raw.githubusercontent.com/mhartington/oceanic-next/master/colors/OceanicNext.vim -O ~/.config/nvim/colors/OceanicNext.vim
vim.cmd.colorscheme("OceanicNext")
vim.cmd('filetype plugin indent on')

vim.cmd('cabbr vf vert sf')
vim.cmd('cabbr vb vert sb')

-- Switch to file with same basename but different extension
vim.cmd('cabbr E e %<')
vim.cmd('cabbr V vs %<')
