local lspconfig = require('lspconfig')
local coq = require('coq')

lspconfig.clangd.setup{}
lspconfig.pylsp.setup(coq.lsp_ensure_capabilities())

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    vim.cmd('COQnow --shut-up')
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
    vim.api.nvim_create_autocmd("BufWritePost", {
        callback = function()
            vim.lsp.buf.format{async = true}
        end
    })
  end,
})

