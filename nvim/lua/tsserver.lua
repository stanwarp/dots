local map = vim.keymap.set


local M = {}
M.setup = function(on_attach, capabilities)
    require("typescript").setup({
        server = {
            on_attach = function(client, bufnr)
                on_attach(client, bufnr)

                map(bufnr, "n", "go", ":TypescriptAddMissingImports<CR>")
                map(bufnr, "n", "gO", ":TypescriptOrganizeImports<CR>")
                map(bufnr, "n", "gI", ":TypescriptRenameFile<CR>")

                -- map(bufnr, "i", "${", change_template_string_quotes, { nowait = true })

                -- u.buf_command(bufnr, "CssToJs", css_to_js, { range = true })
                -- u.buf_map(bufnr, "n", "gx", ":set opfunc=v:lua.css_to_js<CR>g@")
                -- u.buf_map(bufnr, "n", "gxx", ":CssToJs<CR>")
                -- u.buf_map(bufnr, "v", "gx", ":CssToJs<CR>")

                -- override
                map(bufnr, "n", "gd", ":TypescriptGoToSourceDefinition<CR>")
            end,
            capabilities = capabilities,
        },
    })
end

return M
