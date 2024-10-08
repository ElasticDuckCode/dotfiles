local telescope = require('telescope')
local builtin = require('telescope.builtin')
local extensions = telescope.extensions

telescope.setup {
    pickers = {
        buffers = {
            theme = "dropdown",
            previewer = false,
        },
    },
    extensions = {
        conda = { anaconda_path = vim.fn.expand('$HOME/.mambaforge/') }
    }
}

vim.keymap.set('n', '<leader>sf', builtin.find_files, {})
vim.keymap.set('n', '<leader>sg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>sb', builtin.buffers, {})
vim.keymap.set('n', '<leader>sh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>sc', extensions.conda.conda, {})
