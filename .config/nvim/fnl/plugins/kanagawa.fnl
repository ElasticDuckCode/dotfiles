(import-macros {: tx} :config.macros)

(tx "rebelot/kanagawa.nvim" {
:lazy false
:priority 1000
:opts {
      :colors {:theme {:all {:ui {:bg_gutter "none"}}}}
      :theme "dragon"
      :background {:dark "dragon" :light "lotus"}
      :overrides (fn [colors]
                   (let [theme colors.theme palette colors.palette]
                     {
                     :NormalFloat {:bg "none"}
                     :FloatBorder {:bg "none"}
                     :FloatTitle {:bg "none"}
                     :NormalDark {:bg theme.ui.bg_m3 :fg theme.ui.fg_dim}
                     :LazyNormal {:bg theme.ui.bg_m3 :fg theme.ui.fg_dim}
                     :MasonNormal {:bg theme.ui.bg_m3 :fg theme.ui.fg_dim}
                     :TelescopeTitle {:fg theme.ui.special :bold true }
                     :TelescopeBorder {:bg theme.ui.bg_p1 :fg theme.ui.bg_p1}
                     :TelescopePromptNormal {:bg theme.ui.bg_p1}
                     :TelescopeResultsNormal {:bg "none" :fg theme.ui.fg_dim}
                     :TelescopePreviewNormal {:bg theme.ui.bg_dim}
                     :Pmenu {:bg theme.ui.bg_m2 :fg theme.ui.shade0 :blend vim.o.pumblend}
                     :PmenuSel {:bg theme.ui.bg_p2 :fg "NONE"}
                     :PmenuSbar {:bg theme.ui.bg_m1}
                     :PmenuThumb {:bg theme.ui.bg_p2}
                     }))
      }
:enabled true})

