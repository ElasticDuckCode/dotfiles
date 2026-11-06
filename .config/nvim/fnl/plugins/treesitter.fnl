(import-macros {: tx} :config.macros)


(tx "nvim-treesitter/nvim-treesitter" {
:branch "master"
:lazy false
:build ":TSUpdate"
:config (fn []
          (let [configs (require "nvim-treesitter.configs")]
            (configs.setup {
                :ensure_installed ["c" "lua" "vim" "vimdoc" "query" "markdown" "markdown_inline"]
                :sync_install false
                :auto_install true
                :ignore_install {}
                :highlight {:enable true :additional_vim_regex_highlighting true}
                :indent {:enable true}})))
:enabled true})
