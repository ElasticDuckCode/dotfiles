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
    --essentials
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            'IllustratedMan-code/telescope-conda.nvim',
        }
    },
    { "nvim-treesitter/nvim-treesitter",    cmd = "TSUpdate" },

    -- extras
    { "folke/zen-mode.nvim" },
    { "christoomey/vim-tmux-navigator" },
    { "ThePrimeagen/vim-be-good" },
    { "nvim-tree/nvim-web-devicons" },



    --themes
    { "folke/tokyonight.nvim",              lazy = false,    priority = 1000 },
    { "rebelot/kanagawa.nvim",              lazy = false,    priority = 1000 },
    { "rose-pine/neovim",                   lazy = false,    priority = 1000 },
    { "ellisonleao/gruvbox.nvim",           lazy = false,    priority = 1000 },

    --tpope
    { "tpope/vim-fugitive" },
    { "tpope/vim-commentary" },
    { "tpope/vim-surround" },

    --lsp+cmp
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-cmdline" },
    { "hrsh7th/cmp-nvim-lua" },
    { "hrsh7th/cmp-nvim-lsp" },
    { 'hrsh7th/cmp-nvim-lsp-signature-help' },
    { "L3MON4D3/LuaSnip" },
    { "saadparwaiz1/cmp_luasnip" },

    --debugging
    { "mfussenegger/nvim-dap" },
    { "rcarriga/nvim-dap-ui" },
    { "theHamsta/nvim-dap-virtual-text" },
    { "nvim-telescope/telescope-dap.nvim" },
    { "mfussenegger/nvim-dap-python" },

}

-- declare custom opts
local opts = {}

-- setup lazy
require("lazy").setup(plugins, opts)
