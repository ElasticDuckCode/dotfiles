-- leader key
vim.keymap.set('n', '<Space>', '<Nop>', { noremap = true })
vim.g.mapleader = ' '

-- file explorer
vim.keymap.set('n', '<leader>pn', vim.cmd.Ex)

-- disable arrow keys
for _, key in ipairs({ '<Up>', '<Down>', '<Left>', '<Right>' }) do
    vim.keymap.set({ '', '!' }, key, '<Nop>', { noremap = true })
end

-- better way to move line
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep view centered when running these
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- yank into system clipboard when leader yanked
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- don't want
vim.keymap.set("n", "Q", "<nop>")
vim.api.nvim_create_user_command('W', 'w', {})
vim.api.nvim_create_user_command('Q', 'q', {})
vim.api.nvim_create_user_command('X', 'x', {})

-- tmux sessionizer from primeagen
vim.keymap.set("n", "<C-f>", "<Nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
