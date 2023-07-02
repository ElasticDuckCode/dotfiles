-- leader key
vim.keymap.set('n', '<Space>', '<Nop>', { noremap = true })
vim.g.mapleader = ' '

-- file shortcuts
vim.keymap.set('n', '<leader>ev', '<CMD>e ~/.config/nvim/<CR>', { noremap = true, silent = true })

-- disable arrow keys
for _, key in ipairs({ '<Up>', '<Down>', '<Left>', '<Right>' }) do
    vim.keymap.set({ '', '!' }, key, '<Nop>', { noremap = true })
end
