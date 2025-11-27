-- indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- undo file
vim.opt.swapfile = false --not once have I needed them, yet they annoy me always
vim.opt.undodir = os.getenv("HOME") .. '/.local/share/nvim/undodir'
vim.opt.undofile = true

-- remember cursor position
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
    pattern = { "*" },
    callback = function()
        vim.api.nvim_exec2('silent! normal! g`"zv', { output = true })
    end,
})

-- line wrapping
vim.opt.wrap = true
vim.opt.linebreak = true
vim.o.showbreak = '⤷ '

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
vim.g.netrw_banner = 0

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
            [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
        },
        numhl = {
            [vim.diagnostic.severity.WARN] = 'WarningMsg',
        },
    },
    virtual_text = { current_line = true },
    virtual_lines = false
})
