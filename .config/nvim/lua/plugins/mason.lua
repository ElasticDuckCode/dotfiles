return {
    {
        "mason-org/mason.nvim",
        opts = {},
        enabled = true
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {},
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
        enabled = true
    },
}
