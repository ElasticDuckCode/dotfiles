return {
    'stevearc/oil.nvim',
    opts = {
        delete_to_trash = true,
        win_options = {
            signcolumn = "yes"
        },
        view_options = {
            show_hidden = false,
            is_hidden_file = function(name, bufnr)
                if name == "." or name == ".." then
                    return false
                end
                return vim.startswith(name, ".")
            end,
        },
    },
    lazy = false,
}
