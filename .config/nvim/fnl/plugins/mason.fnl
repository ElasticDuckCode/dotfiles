(import-macros {: tx} :config.macros)

[
(tx "mason-org/mason.nvim" {
:opts {}
:enabled true})

(tx "mason-org/mason-lspconfig.nvim" {
:opts {}
:dependencies [(tx "mason-org/mason.nvim" {:opts {}}) "neovim/nvim-lspconfig"]
:enabled true})
]

