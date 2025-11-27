return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim", },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    vim.keymap.set('n', '<leader>st', ":TodoTelescope<CR>", { noremap = true, silent = true })
  }
}
