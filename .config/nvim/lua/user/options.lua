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
vim.opt.scrolljump = -40
vim.opt.scrolloff = 8

-- statusline
vim.opt.showmode = true

-- search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- update time
vim.opt.updatetime = 50

-- netrw
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
