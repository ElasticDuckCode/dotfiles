-- [nfnl] fnl/plugins/commentary.fnl
local function _1_()
  return vim.keymap.set({"n", "x"}, "<C-_>", ":Commentary<CR>", {noremap = true, silent = true})
end
return {"tpope/vim-commentary", config = _1_, enabled = true}
