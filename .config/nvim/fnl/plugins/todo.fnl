(import-macros {: tx} :config.macros)

(tx "folke/todo-comments.nvim" {
:dependencies ["nvim-lua/plenary.nvim" "nvim-telescope/telescope.nvim"]
:opts [(vim.keymap.set "n" "<leader>st" ":TodoTelescope<CR>" {:noremap true :silent true})]
:enabled true})
