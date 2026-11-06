-- [nfnl] fnl/config/themes.fnl
vim.opt.termguicolors = true
vim.o.background = "dark"
vim.wo.colorcolumn = "-1"
vim.cmd("match DiffDelete /\\%80v./")
local function apply_colors()
  vim.cmd("colorscheme kanagawa")
  vim.api.nvim_set_hl(0, "Pmenu", {link = "Normal"})
  vim.api.nvim_set_hl(0, "TelescopeNormal", {link = "Pmenu"})
  vim.api.nvim_set_hl(0, "TelescopePromptNormal", {link = "Pmenu"})
  return vim.api.nvim_set_hl(0, "TelescopeBorder", {link = "Pmenu"})
end
return apply_colors()
