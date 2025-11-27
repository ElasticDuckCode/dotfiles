return {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        colors = { theme = { all = { ui = { bg_gutter = "none" } } } },
        transparent = false,
        theme = "dragon",
        background = { dark = "dragon", light = "lotus" },
        overrides = function(colors)
            local theme = colors.theme
            local palette = colors.palette
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
    },
    enabled = true
}
