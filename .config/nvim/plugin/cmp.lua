local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

local _border = "rounded"
local _highlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None"

cmp.setup({
    print("loading sources"),
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
