return {
    "mfussenegger/nvim-dap",
    dependencies = {
        { 'theHamsta/nvim-dap-virtual-text' },
        { "rcarriga/nvim-dap-ui",           dependencies = { "nvim-neotest/nvim-nio" } },
    },
    config = function()
        local dap = require('dap')

        dap.adapters.gdb = {
            type = 'executable',
            command = 'gdb',
            args = { '-i', 'dap' }
        }

        dap.configurations.cpp = {
            {
                name = "Launch",
                type = "gdb",
                request = "launch",
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = true,
                args = {},
            },
            {
                name = "Attach",
                type = "gdb",
                request = "attach",
                pid = function()
                    return vim.fn.input('PID to attach to: ')
                end,
                cwd = '${workspaceFolder}',
            },
        }

        vim.keymap.set("n", "<F5>", dap.continue)
        vim.keymap.set("n", "<F10>", dap.step_over)
        vim.keymap.set("n", "<S-F10>", dap.step_back)
        vim.keymap.set("n", "<F11>", dap.step_into)
        vim.keymap.set("n", "<S-F11>", dap.step_out)
        vim.keymap.set("n", "<F12>", dap.toggle_breakpoint)

        require('dapui').setup()
        require('nvim-dap-virtual-text').setup()
    end,
}
