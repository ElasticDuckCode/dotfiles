--
-- packer.nvim configuration file
--

-- Note: must run :PackerComplile whenever changes made.

return require('packer').startup(
function()
    use 'wbthomason/packer.nvim'
    use 'folke/tokyonight.nvim'
end
)
