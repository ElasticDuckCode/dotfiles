(import-macros {: tx} :config.macros)

(tx "nvim-telescope/telescope.nvim" {
:tag "v0.1.9"
:dependencies [ (tx "nvim-lua/plenary.nvim")
		(tx "nvim-telescope/telescope-fzf-native.nvim" { :build "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release --target install"})]
:config (fn []

	  (let [telescope (require "telescope")
			  builtin (require "telescope.builtin")
			  extensions telescope.extensions]

	    (telescope.setup {
	       :defaults {:initial_mode "insert"}
	       :pickers {
			       :buffers {:theme "dropdown" :previewer true}
			       :find_files {:theme "dropdown" :previewer true}
			       :live_grep {:theme "dropdown" :previewer true}
			       :help_tags {:theme "dropdown" :previewer true}
			       :extensions {}
	       }
	       })

	    (telescope.load_extension "fzf")

	    (vim.keymap.set "n" "<leader>sf" (fn [] (builtin.find_files)) {})
	    (vim.keymap.set "n" "<leader>sg" (fn [] (builtin.live_grep {:cwd (vim.fn.getcwd)}) {}))
	    (vim.keymap.set "n" "<leader>sf" (fn [] (builtin.find_files)) {})
	    (vim.keymap.set "n" "<leader>sh" (fn [] (builtin.help_tags)) {})

	    ))
:enabled true})
	
