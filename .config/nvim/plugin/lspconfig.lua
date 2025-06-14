require('mason').setup()
require('mason-lspconfig').setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local function on_attach(client, bufnr)
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format()
            end,
        })
    end
end

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<leader>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<leader>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)

        -- -- Show in-line diagnostics
        -- vim.diagnostic.config({
        --     virtual_text = true
        -- })
        -- -- Show line diagnostics automatically in hover window
        -- vim.o.updatetime = 250
        -- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
    end,
})

require("lspconfig").lua_ls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = { Lua = { diagnostics = { globals = { 'vim' } } } },
}

require("lspconfig").clojure_lsp.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

require("lspconfig").pylsp.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = { enabled = true, ignore = { "E203", "W503" }, maxLineLength = 121 },
                black = { enabled = true },
                isort = { enabled = true },
                mypy = { enabled = true },
            },
        },
    },
}

require("lspconfig").clangd.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

--require("mason-lspconfig").setup_handlers {
--    function(server_name) -- default handler (optional)
--        require("lspconfig")[server_name].setup {
--            capabilities = capabilities,
--            on_attach = on_attach,
--        }
--    end,
--    ["lua_ls"] = function()
--        require("lspconfig").lua_ls.setup {
--            settings = { Lua = { diagnostics = { globals = { 'vim' } } } },
--            capabilities = capabilities,
--            on_attach = on_attach,
--        }
--    end,
--}
