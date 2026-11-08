(import-macros {: tx} :config.macros)

(tx "nvim-treesitter/nvim-treesitter" {
:lazy false
:build ":TSUpdate"
:config (fn [] (vim.api.nvim_create_autocmd "FileType" {
          :pattern "*"
          :callback (fn [args] (let [lang (vim.treesitter.language.get_lang args.match)]
                                 (if (and lang (vim.treesitter.language.add lang))
                                          (vim.treesitter.start args.buf))))}))
:enabled true})
