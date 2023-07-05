require("tokyonight").setup({
    style = "night",
    light_style = "day",
    transparent = false,
    terminal_colors = true,
})
vim.cmd [[colorscheme tokyonight]]

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
