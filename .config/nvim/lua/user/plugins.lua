-- bootstrap lazy if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- declare plugins
local plugins = {
    { "nvim-telescope/telescope.nvim",      branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
    { "folke/tokyonight.nvim",              lazy = false,     priority = 1000,                           opts = {}, },
    { "nvim-treesitter/nvim-treesitter",    cmd = "TSUpdate" },
    { "tpope/vim-fugitive" },
    { "folke/zen-mode.nvim" },
    { "christoomey/vim-tmux-navigator" },
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "L3MON4D3/LuaSnip" },
    { "saadparwaiz1/cmp_luasnip" },
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },
    { 'hrsh7th/cmp-nvim-lsp-signature-help' },
}

-- declare custom opts
local opts = {}

-- setup lazy
require("lazy").setup(plugins, opts)
