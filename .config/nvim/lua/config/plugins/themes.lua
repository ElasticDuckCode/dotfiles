vim.opt.termguicolors = true
vim.o.background = 'dark'

--require("tokyonight").setup({ style = "night", transparent = true })
--require("rose-pine").setup({ variant = "main", disable_background = false })
--require("gruvbox").setup({ overrides = { SignColumn = { bg = "none" } } })

require('kanagawa').setup({
    colors = { theme = { all = { ui = { bg_gutter = "none" } } } },
    transparent = false,
    theme = "dragon",
    background = { dark = "dragon", light = "lotus" },
    overrides = function(colors)
        local theme = colors.theme
        return {

            NormalFloat = { bg = "none" },
            FloatBorder = { bg = "none" },
            FloatTitle = { bg = "none" },
            NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
            LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            TelescopeTitle = { fg = theme.ui.special, bold = true },
            TelescopeBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
            TelescopePromptNormal = { bg = theme.ui.bg_p1 },
            TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = "none" },
            TelescopePreviewNormal = { bg = theme.ui.bg_dim },
            Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_m2, blend = vim.o.pumblend }, -- add `blend = vim.o.pumblend` to enable transparency
            PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
            PmenuSbar = { bg = theme.ui.bg_m1 },
            PmenuThumb = { bg = theme.ui.bg_p2 },
        }
    end,
})

function apply_colors()
    vim.cmd [[ colorscheme kanagawa ]]
    -- vim.api.nvim_set_hl(0, "Pmenu", { link = "Normal" })
    -- vim.api.nvim_set_hl(0, "TelescopeNormal", { link = "Pmenu" })
    -- vim.api.nvim_set_hl(0, "TelescopePromptNormal", { link = "Pmenu" })
    -- vim.api.nvim_set_hl(0, "TelescopeBorder", { link = "Pmenu" })
end

apply_colors()

-- Instead of colorcolumn, just highlight when exceeding
vim.wo.colorcolumn = '-1'
--vim.cmd [[match OverLength /\%81v.*/]]
vim.cmd [[match DiffDelete /\%80v./]]
