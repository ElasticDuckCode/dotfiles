return {
    "https://github.com/neovim/nvim-lspconfig",
    config = function()
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*.c,*.cpp,*.c++,*.h,*.hpp,*.h++,*.lua",
            callback = function()
                vim.lsp.buf.format({ async = true })
            end,
        })

        vim.lsp.config("clangd", {
            settings = {
                cmd = { "clangd --header-insertion=never" },
            }
        })

        vim.lsp.config("lua_ls", {
            on_init = function(client)
                if client.workspace_folders then
                    local path = client.workspace_folders[1].name
                    if
                        path ~= vim.fn.stdpath("config")
                        and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
                    then
                        return
                    end
                end

                client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
                    runtime = {
                        version = "LuaJIT",
                        path = {
                            "lua/?.lua",
                            "lua/?/init.lua",
                        },
                    },
                    -- Make the server aware of Neovim runtime files
                    workspace = {
                        checkThirdParty = false,
                        library = {
                            vim.env.VIMRUNTIME
                        }
                    }
                })
            end,
            settings = {
                Lua = {}
            }
        })

        vim.lsp.enable("clangd")
        vim.lsp.enable("lua_ls")
    end,
    enabled = true
}
