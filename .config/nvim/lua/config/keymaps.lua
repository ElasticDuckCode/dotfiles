-- file explorer
vim.keymap.set("n", "<leader>pn", vim.cmd.Ex)

-- disable arrow keys
for _, key in ipairs({ '<Up>', '<Down>', '<Left>', '<Right>' }) do
    vim.keymap.set({ '', '!' }, key, '<Nop>', { noremap = true })
end

-- make these commands not jump view
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- helpful to map ctrl-enter to enter
vim.keymap.set("i", "<C-CR>", "<CR>")
vim.keymap.set("n", "<C-CR>", "<CR>")

-- open netrw
vim.keymap.set("n", "<leader><CR>", "<cmd>silent Explore<CR>")
vim.keymap.set("n", "<leader><Tab>", "<cmd>silent Texplore<CR>")

-- netrw tab nagivation
for i = 1, 9 do
    local key = string.format("<leader>%d", i)
    local cmd = string.format("%dgt", i)
    vim.keymap.set("n", key, cmd);
end

-- move lines in visual mode
vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv")

-- captial write/quit still work
vim.api.nvim_create_user_command('W', 'w', {})
vim.api.nvim_create_user_command('Q', 'q', {})
vim.api.nvim_create_user_command('X', 'x', {})

-- yank into system clipboard when leader yanked
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- don't want
vim.keymap.set("n", "Q", "<nop>")

-- tmux sessionizer from primeagen
vim.keymap.set("n", "<C-f>", "<Nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- change variable names within scope.
vim.keymap.set("n", "civ", "gdva{::s/<C-R>///gc<left><left><left>", { noremap = true })
--vim.keymap.set("n", "civ", "gR gD:%s/<C-R>///gc<left><left><left>", { noremap = true })
