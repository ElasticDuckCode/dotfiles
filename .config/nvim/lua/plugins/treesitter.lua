-- [nfnl] fnl/plugins/treesitter.fnl
local function _1_()
  local configs = require("nvim-treesitter.configs")
  return configs.setup({ensure_installed = {"c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline"}, auto_install = true, ignore_install = {}, highlight = {enable = true, additional_vim_regex_highlighting = true}, indent = {enable = true}, sync_install = false})
end
return {"nvim-treesitter/nvim-treesitter", branch = "master", build = ":TSUpdate", config = _1_, enabled = true, lazy = false}
