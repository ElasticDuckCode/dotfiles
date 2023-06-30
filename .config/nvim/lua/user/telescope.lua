-- telescope extensions
local telescope = require('telescope')
local builtin = require('telescope.builtin')

telescope.load_extension('project')
telescope.load_extension('file_browser')

-- keymaps
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>h', builtin.help_tags, {})

local projects = telescope.extensions.project
vim.keymap.set('n', '<leader>p', projects.project, {})

local file_browser = telescope.extensions.file_browser
vim.keymap.set('n', '<leader>n', file_browser.file_browser, {})
