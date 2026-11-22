-- indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- undo file
vim.opt.swapfile = false --not once have I needed them, yet they annoy me always
vim.opt.undodir = os.getenv("HOME") .. "/.local/share/nvim/undodir"
vim.opt.undofile = true

-- remember cursor position
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
    pattern = { "*" },
    callback = function()
        vim.api.nvim_exec2("silent! normal! g`\"zv", { output = true })
    end,
})

-- line wrapping
vim.opt.wrap = true
vim.opt.linebreak = true
vim.o.showbreak = "⤷ "

-- number/sign/cursor line
vim.opt.number = false
vim.wo.signcolumn = "yes"

-- screensplits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- buffers
vim.opt.hidden = true

-- scrolling
vim.opt.scrolljump = 0
vim.opt.scrolloff = 8

-- statusline
vim.opt.showmode = true
vim.opt.laststatus = 3

-- search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- update time
vim.opt.updatetime = 50

-- netrw
vim.g.netrw_browse_split = 0
vim.g.netrw_keepdir = 0
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3 -- show as tree, use 'gn' to set folder as new root
vim.g.netrw_preview = 1
vim.g.netrw_wiw = 1

-- If installed oil.nvim, replace netrw
if vim.fn.exists(":Oil") == 2 then
    vim.api.nvim_create_user_command("Explore", "Oil", { nargs = "?", complete = "dir" })
    vim.api.nvim_create_user_command("Sexplore", "split | Oil", { nargs = "?", complete = "dir" })
    vim.api.nvim_create_user_command("Vexplore", "vsplit | Oil", { nargs = "?", complete = "dir" })
    vim.api.nvim_create_user_command("Texplore", "tabnew | Oil", { nargs = "?", complete = "dir" })
end

-- autocompletion
vim.opt.completeopt = { "menuone", "noselect", "popup" }
vim.opt.complete:append("o") -- include omni
vim.o.winborder = "none"
vim.o.pumborder = "none"

-- errors/warnings
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = " ",
            [vim.diagnostic.severity.INFO] = " ",
        },
        linehl = {
            [vim.diagnostic.severity.ERROR] = "ErrorMsg",
        },
        numhl = {
            [vim.diagnostic.severity.WARN] = "WarningMsg",
        },
    },
    virtual_text = { current_line = true },
    virtual_lines = false
})

-- trailing whitespace
local cleanwhitespace = function()
    local cursor = vim.fn.getpos(".")
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.setpos(".", cursor)
end
-- vim.o.list = true
-- vim.o.listchars = 'tab:» ,lead:•,trail:•'
vim.keymap.set("n", "<leader>cw", cleanwhitespace)
