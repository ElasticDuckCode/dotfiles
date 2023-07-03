-- leader key
vim.keymap.set('n', '<Space>', '<Nop>', { noremap = true })
vim.g.mapleader = ' '

-- file explorer
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- disable arrow keys
for _, key in ipairs({ '<Up>', '<Down>', '<Left>', '<Right>' }) do
    vim.keymap.set({ '', '!' }, key, '<Nop>', { noremap = true })
end
