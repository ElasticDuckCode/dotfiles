local _border = "single"
local _highlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None"

local lsp = require('lsp-zero')
local lspconfig = require('lspconfig')
local cmp = require('cmp')

lsp.preset('recommended')

lsp.set_sign_icons({
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = '»'
})

lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

local cmp_action = lsp.cmp_action()
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-CR>'] = cmp.mapping.confirm({ select = true }),

    -- Navigate between snippet placeholder
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

cmp.setup({
    sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'buffer',                 keyword_length = 3 },
        { name = 'luasnip',                keyword_length = 2 },
    },
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

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_create_autocmd("BufWritePre", {
            callback = function()
                vim.lsp.buf.format()
            end
        })
    end
end)

lsp.setup()
