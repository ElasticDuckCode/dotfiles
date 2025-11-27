vim.opt.termguicolors = true
vim.o.background = 'dark'

-- Instead of colorcolumn, just highlight when exceeding
vim.wo.colorcolumn = '-1'
--vim.cmd [[match OverLength /\%81v.*/]]
vim.cmd [[match DiffDelete /\%80v./]]

local function apply_colors()
    vim.cmd [[ colorscheme kanagawa ]]
    vim.api.nvim_set_hl(0, "Pmenu", { link = "Normal" })
    vim.api.nvim_set_hl(0, "TelescopeNormal", { link = "Pmenu" })
    vim.api.nvim_set_hl(0, "TelescopePromptNormal", { link = "Pmenu" })
    vim.api.nvim_set_hl(0, "TelescopeBorder", { link = "Pmenu" })
end

apply_colors()

--require("tokyonight").setup({ style = "night", transparent = true })
--require("rose-pine").setup({ variant = "main", disable_background = false })
--require("gruvbox").setup({ overrides = { SignColumn = { bg = "none" } } })
