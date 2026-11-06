-- [nfnl] fnl/plugins/todo.fnl
return {"folke/todo-comments.nvim", dependencies = {"nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim"}, enabled = true, opts = {vim.keymap.set("n", "<leader>st", ":TodoTelescope<CR>", {noremap = true, silent = true})}}
