--
-- packer.nvim configuration file
--

-- Note: must run :PackerComplile whenever changes made.
return require('packer').startup(
    function()
        use 'wbthomason/packer.nvim'

        -- Colorschmes
        use 'folke/tokyonight.nvim'
        use 'rose-pine/neovim'
        use 'sainnhe/everforest'
        use 'neanias/everforest-nvim'

        -- Tmux Integration
        use 'christoomey/vim-tmux-navigator'

        -- Telescope
        use { 'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = { 'nvim-lua/plenary.nvim' } }
        use 'nvim-telescope/telescope-project.nvim'
        use 'nvim-telescope/telescope-file-browser.nvim'

        -- Treesitter
        use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

        -- LSP
        use {
            'VonHeikemen/lsp-zero.nvim',
            branch = 'v2.x',
            requires = {
                -- LSP Support
                { 'neovim/nvim-lspconfig' }, -- Required
                {                            -- Optional
                    'williamboman/mason.nvim',
                    run = function()
                        pcall(vim.cmd, 'MasonUpdate')
                    end,
                },
                { 'williamboman/mason-lspconfig.nvim' }, -- Optional

                -- Autocompletion
                { 'hrsh7th/nvim-cmp' },     -- Required
                { 'hrsh7th/cmp-nvim-lsp' }, -- Required
                { 'L3MON4D3/LuaSnip' },     -- Required
            }
        }
    end
)
