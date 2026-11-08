-- [nfnl] fnl/plugins/lspconfig.fnl
local function _1_()
  local function _2_()
    return vim.lsp.buf.format({async = true})
  end
  vim.api.nvim_create_autocmd("BufWritePre", {pattern = "*.c,*.cpp,*.c++,*.h,*.hpp,*.h++,*.lua", callback = _2_})
  vim.lsp.config("clangd", {settings = {cmd = {"clangd --header-insertion=never"}}})
  local function _3_(client)
    local f
    local function _4_()
      client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {runtime = {version = "LuaJIT", path = {["lua/?.lua"] = "lua/?/init.lua"}}, workspace = {library = {vim.env.VIMRUNTIME}, checkThirdParty = false}})
      return nil
    end
    f = _4_
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if ((path ~= vim.fn.stdpath("config")) and (vim.uv.fs_stat((path .. "/.luarc.json")) or vim.uv.fs_stat((path .. "/.luarc.jsonc")))) then
        return nil
      else
        return f()
      end
    else
      return f()
    end
  end
  vim.lsp.config("lua_ls", {on_init = _3_, settings = {Lua = {}}})
  vim.lsp.enable("clangd")
  return vim.lsp.enable("lua_ls")
end
return {"https://github.com/neovim/nvim-lspconfig", config = _1_, enabled = false}
