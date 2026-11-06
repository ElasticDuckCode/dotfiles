-- [nfnl] fnl/config/options.fnl
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.swapfile = false
vim.opt.undodir = (os.getenv("HOME") .. "/.local/share/nvim/undodir")
vim.opt.undofile = true
local function _1_()
  return vim.api.nvim_exec2("silent! normal! g`\"zv", {output = true})
end
vim.api.nvim_create_autocmd({"BufReadPost"}, {pattern = {"*"}, callback = _1_})
vim.opt.wrap = true
vim.opt.linebreak = true
vim.o.showbreak = "\226\164\183 "
vim.opt.number = false
vim.wo.signcolumn = "yes"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.hidden = true
vim.opt.scrolljump = 0
vim.opt.scrolloff = 8
vim.opt.showmode = true
vim.opt.laststatus = 3
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.updatetime = 50
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
do
  local signs = {Error = "\239\129\151 ", Warn = "\239\129\177 ", Hint = "\239\129\154 ", Info = "\239\129\170 "}
  for type, icon in pairs(signs) do
    local hl = ("DiagnosticSign" .. type)
    vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
  end
end
return vim.diagnostic.config({signs = {text = {[vim.diagnostic.severity.ERROR] = "\239\129\151 ", [vim.diagnostic.severity.WARN] = "\239\129\177 ", [vim.diagnostic.severity.HINT] = "\239\129\154 ", [vim.diagnostic.severity.INFO] = "\239\129\170 "}, linehl = {[vim.diagnostic.severity.ERROR] = "ErrorMsg"}, numhl = {[vim.diagnostic.severity.WARN] = "WarningMsg"}}, virtual_text = {current_line = true}, virtual_lines = false})
