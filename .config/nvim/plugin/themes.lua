vim.opt.termguicolors = true
vim.o.background = 'dark'

require("tokyonight").setup({ style = "night", transparent = true })
require('kanagawa').setup({
    colors = { theme = { wave = { ui = { float = { bg = "none", }, }, }, all = { ui = { bg_gutter = "none" } } } },
    transparent = true,
    background = "dragon",
})
require("rose-pine").setup({ variant = "main", disable_background = true })


function apply_colors()
    vim.cmd [[ colorscheme rose-pine ]]
    vim.api.nvim_set_hl(0, "Pmenu", { link = "Normal" })
    vim.api.nvim_set_hl(0, "TelescopeNormal", { link = "Pmenu" })
    vim.api.nvim_set_hl(0, "TelescopePromptNormal", { link = "Pmenu" })
    vim.api.nvim_set_hl(0, "TelescopeBorder", { link = "Pmenu" })
end

apply_colors()

-- Instead of colorcolumn, just highlight when exceeding
vim.wo.colorcolumn = '-1'
--vim.cmd [[match OverLength /\%81v.*/]]
vim.cmd [[match DiffDelete /\%80v./]]
