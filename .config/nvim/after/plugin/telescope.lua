-- telescope extensions
local telescope = require('telescope')
local builtin = require('telescope.builtin')

telescope.setup {
    pickers = {
        buffers = {
            theme = "dropdown",
            previewer = false
        }
    }
}


-- keymaps
vim.keymap.set('n', '<leader>sf', builtin.find_files, {})
vim.keymap.set('n', '<leader>sg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>sb', builtin.buffers, {})
vim.keymap.set('n', '<leader>sh', builtin.help_tags, {})

-- project extension
telescope.load_extension('project')
local projects = telescope.extensions.project
vim.keymap.set('n', '<leader>sp', projects.project, {})
