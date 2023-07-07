require('mason').setup()
require('mason-lspconfig').setup()

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

local _border = "rounded"
local _highlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None"

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'luasnip',                keyword_length = 2 },
        { name = 'buffer',                 keyword_length = 2 },
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-e>'] = cmp.mapping.abort(),
        ["<C-Space>"] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<C-CR>'] = cmp.mapping.confirm({ select = false }),
        ["<C-n>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_next_item(cmp_select)
            else
                cmp.complete()
            end
        end, { "i", "c", "s" }),
        ["<C-p>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item(cmp_select)
            else
                cmp.complete()
            end
        end, { "i", "c", "s" }),
    }),
    window = {
        completion = cmp.config.window.bordered({
            border = _border,
            winhighlight = _highlight
        }),
        documentation = cmp.config.window.bordered({
            border = _border,
            winhighlight = _highlight
        }),
    }
})

cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer', keyword_length = 2 }
    }
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path', keyword_length = 2 }
    }, {
        { name = 'cmdline', keyword_length = 2 }
    })
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover, {
        border = _border,
        winhighlight = _highlight
    }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help, {
        border = _border,
        winhighlight = _highlight
    }
)

vim.diagnostic.config {
    float = {
        border = _border,
        winhighlight = _highlight
    }
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("mason-lspconfig").setup_handlers {
    function(server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {
            capabilities = capabilities,
        }
    end,
    ["lua_ls"] = function()
        require("lspconfig").lua_ls.setup {
            settings = { Lua = { diagnostics = { globals = { 'vim' } } } },
            capabilities = capabilities,
        }
    end
}

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        vim.api.nvim_create_autocmd("BufWritePre", {
            callback = function()
                vim.lsp.buf.format()
            end
        })
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})
