-- [nfnl] fnl/plugins/nvim-treesitter.fnl
local function _1_()
  local function _2_(args)
    local lang = vim.treesitter.language.get_lang(args.match)
    if (lang and vim.treesitter.language.add(lang)) then
      return vim.treesitter.start(args.buf)
    else
      return nil
    end
  end
  return vim.api.nvim_create_autocmd("FileType", {pattern = "*", callback = _2_})
end
return {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate", config = _1_, enabled = true, lazy = false}
