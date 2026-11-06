(import-macros {: tx} :config.macros)

 ;; Ctrl-/ to comment
(tx "tpope/vim-commentary" {
:config (fn [] (vim.keymap.set ["n" "x"] "<C-_>" ":Commentary<CR>" {:noremap true :silent true}))
:enabled true})
