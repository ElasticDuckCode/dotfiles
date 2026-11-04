return {
    "tpope/vim-commentary",
    config = function()
        -- Map Ctrl-/ to comment
        vim.keymap.set({ "n", "x" }, "<C-_>", ":Commentary<CR>", { noremap = true, silent = true })
    end,
    enabled = true
}
