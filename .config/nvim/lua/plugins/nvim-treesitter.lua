return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        dependencies = { "mks-h/treesitter-autoinstall.nvim" },
        build = ":TSUpdate",
        config = function()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "*",
                callback = function(args)
                    local lang = vim.treesitter.language.get_lang(args.match)
                    if (lang and vim.treesitter.language.add(lang)) then
                        vim.treesitter.start(args.buf)
                    end
                end
            })
        end,
        enabled = true
    },
    {
        "mks-h/treesitter-autoinstall.nvim",
        opts = {
            ignore = {},
            highlight = true,
            regex = {},
        }
    }
}
