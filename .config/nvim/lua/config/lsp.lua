-- Enable LSPs
vim.lsp.enable("lua_ls")
vim.lsp.enable("clangd")
vim.lsp.enable("pylsp")

-- Whenever an language server is attached, create an an autocmd
-- to format the file when saved.
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = true }),
    callback = function()
        vim.api.nvim_create_autocmd("BufWritePre", {
            callback = function()
                vim.lsp.buf.format({ async = true })
            end,
        })
    end,
})
