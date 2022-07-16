-- leader key
vim.keymap.set('n', '<Space>', '<Nop>', {noremap = true})
vim.g.mapleader = ' '

-- file shortcuts
vim.keymap.set('n', '<leader><Tab>v', '<CMD>e $MYVIMRC<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<leader><Tab>p', '<CMD>e ~/.config/nvim/<CR>', {noremap = true, silent = true})

-- telescope
vim.keymap.set('n', "<leader>f", '<CMD>Telescope find_files theme=dropdown<CR>', {noremap = true, silent = true})
vim.keymap.set('n', "<leader>g", '<CMD>Telescope live_grep theme=dropdown<CR>', {noremap = true, silent = true})
vim.keymap.set('n', "<leader>b", '<CMD>Telescope buffers theme=dropdown<CR>', {noremap = true, silent = true})
vim.keymap.set('n', "<leader>h", '<CMD>Telescope help_tags theme=dropdown<CR>', {noremap = true, silent = true})

-- disable arrow keys
for _, key in ipairs({'<Up>', '<Down>', '<Left>', '<Right>'}) do
    vim.keymap.set({'', '!'}, key, '<Nop>', {noremap = true})
end
