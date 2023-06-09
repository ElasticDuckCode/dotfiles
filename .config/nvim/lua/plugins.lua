--
-- packer.nvim configuration file
--

-- Note: must run :PackerComplile whenever changes made.
return require('packer').startup(
function()
    use 'wbthomason/packer.nvim'
    use 'folke/tokyonight.nvim'
    use {'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = {'nvim-lua/plenary.nvim'}}
    use 'neovim/nvim-lspconfig'
    use {'ms-jpq/coq_nvim', branch='coq'}
    use {'ms-jpq/coq.thirdparty', branch='3p'}
end
)
