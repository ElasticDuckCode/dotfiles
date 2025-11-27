return {
	"nvim-telescope/telescope.nvim",
	tag = 'v0.1.9',
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release --target install' },
	},
	config = function()
		local telescope = require('telescope')
		local builtin = require('telescope.builtin')
		local extensions = telescope.extensions

		telescope.setup {
			defaults = {
				initial_mode = "insert",
			},
			pickers = {
				buffers = {
					theme = "dropdown",
					previewer = true,
				},
				find_files = {
					theme = "dropdown",
					previewer = true,
				},
				live_grep = {
					theme = "dropdown",
					previewer = true,
				},
				help_tags = {
					theme = "dropdown",
					previewer = true,
				},
			},
			extensions = {
			},
		}

		telescope.load_extension("fzf")


		vim.keymap.set('n', '<leader>sf', builtin.find_files, {})
		vim.keymap.set('n', '<leader>sg', builtin.live_grep, {})
		vim.keymap.set('n', '<leader>sb', builtin.buffers, {})
		vim.keymap.set('n', '<leader>sh', builtin.help_tags, {})
	end,
	enabled = true
}
