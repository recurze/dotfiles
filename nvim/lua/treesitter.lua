require'nvim-treesitter.configs'.setup {
    auto_install = false,
    ensure_installed = { "cpp", "python" },

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false, -- disable :help syntax
    },

    indent = {
        enable = true
    },

    textobjects = {
        select = {
            enable = true,
            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,
            keymaps = {
                ["ac"] = "@class.outer",
                ["if"] = "@outer.inner",
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ai"] = "@conditional.outer",
                ["ii"] = "@conditional.inner",
            },
            include_surrounding_whitespace = true,
        },
        move = {
            enable = true,
            set_jumps = true, -- in jumplist
            -- :help object-motions already defines these
            -- redefining to make it behave like I use it
            goto_next_start = {
                ["]]"] = "@function.outer",
                ["]i"] = "@conditional.outer",
            },
            goto_next_end = {
                ["]["] = "@function.outer",
            },
            goto_previous_start = {
                ["[["] = "@function.outer",
                ["[i"] = "@conditional.outer",
            },
            goto_previous_end = {
                ["[]"] = "@function.outer",
            }
        },

    }
}

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevel = 2

-- Make it normal mode map if used enough
vim.api.nvim_create_user_command('SwapP', "TSTextobjectSwapNext @parameter.inner", {})
vim.api.nvim_create_user_command('SwapI', "TSTextobjectSwapNext @conditional.outer", {})
vim.api.nvim_create_user_command('SwapF', "TSTextobjectSwapNext @function.outer", {})
