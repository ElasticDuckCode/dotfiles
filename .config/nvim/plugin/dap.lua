vim.keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>", { silent = true })
vim.keymap.set("n", "<F10>", ":lua require'dap'.step_over()<CR>", { silent = true })
vim.keymap.set("n", "<F11>", ":lua require'dap'.step_into()<CR>", { silent = true })
vim.keymap.set("n", "<F12>", ":lua require'dap'.step_out()<CR>", { silent = true })
vim.keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", { silent = true })
vim.keymap.set(
    "n",
    "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
    { silent = true }
)
vim.keymap.set(
    "n",
    "<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
    { silent = true }
)
vim.keymap.set(
    "n",
    "<leader>dr",
    ":lua require'dap'.repl.open()<CR>"
)
vim.keymap.set("n", "<F6>", ":lua require('dap.ext.vscode').load_launchjs()<CR>")

local dap = require("dap")
local dapui = require("dapui")

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

require("dap-python").setup('~/.mambaforge/envs/debugpy/bin/python')
require("nvim-dap-virtual-text").setup()
require('dap.ext.vscode').load_launchjs() --auto read launch.json
