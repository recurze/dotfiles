
local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'tagfunc', 'v:lua.vim.lsp.tagfunc')
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- The audacity, when I didn't ask for it.
    vim.diagnostic.disable()

    -- Mappings.
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', 'td', vim.lsp.buf.type_definition, bufopts)

    vim.api.nvim_create_user_command('Rename', function() vim.lsp.buf.rename() end, {})
    vim.api.nvim_create_user_command('Diagno', function() vim.diagnostic.enable() end, {})
end

require 'lspconfig'.clangd.setup{
    on_attach = on_attach
}

