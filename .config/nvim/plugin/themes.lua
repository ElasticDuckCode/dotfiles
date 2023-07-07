vim.opt.termguicolors = true
vim.wo.colorcolumn = '81'
vim.o.background = 'dark'
require("tokyonight").setup({ style = "night" })

function apply_colors()
    vim.cmd [[ colorscheme tokyonight ]]
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

apply_colors()
