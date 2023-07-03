-- telescope extensions
local telescope = require('telescope')
local builtin = require('telescope.builtin')


-- keymaps
vim.keymap.set('n', '<leader>tf', builtin.find_files, {})
vim.keymap.set('n', '<leader>tg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>tb', builtin.buffers, {})
vim.keymap.set('n', '<leader>th', builtin.help_tags, {})

-- project extension
telescope.load_extension('project')
local projects = telescope.extensions.project
vim.keymap.set('n', '<leader>tp', projects.project, {})
