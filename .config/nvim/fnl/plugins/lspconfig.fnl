(import-macros {: tx} :config.macros)


(tx "https://github.com/neovim/nvim-lspconfig" {
:config (fn [] (do 
            (vim.api.nvim_create_autocmd "BufWritePre" {
                :pattern "*.c,*.cpp,*.c++,*.h,*.hpp,*.h++,*.lua"
                :callback (fn [] (vim.lsp.buf.format {:async true}))})

            (vim.lsp.config "clangd" {
                    :settings {:cmd ["clangd --header-insertion=never"]}})

            (vim.lsp.config "lua_ls" {
                :on_init 
                (fn [client]
                            (let [f (fn [] (set client.config.settings.Lua (vim.tbl_deep_extend "force" client.config.settings.Lua {
                                             :runtime {
                                                 :version "LuaJIT"
                                                 :path {"lua/?.lua" "lua/?/init.lua"}}
                                             :workspace {
                                               :checkThirdParty false
                                               :library [vim.env.VIMRUNTIME]
                                             }})))]

                                (if client.workspace_folders
                                    (let [path (. client.workspace_folders 1 :name)]
                                        (if (and (~= path (vim.fn.stdpath "config")) 
                                                (or (vim.uv.fs_stat (.. path "/.luarc.json"))
                                                    (vim.uv.fs_stat (.. path "/.luarc.jsonc"))))
                                            nil
                                            (f)))
                                    (f))))

                :settings {:Lua {}}})

            (vim.lsp.enable "clangd")
            (vim.lsp.enable "lua_ls")
            ))

:enabled false})
