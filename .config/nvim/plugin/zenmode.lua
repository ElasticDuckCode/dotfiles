vim.keymap.set("n", "<leader>zm", function()
    require("zen-mode").toggle()
    apply_colors()
end, { silent = true })
