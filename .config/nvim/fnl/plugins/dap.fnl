(import-macros {: tx} :config.macros)

(tx "mfussenegger/nvim-dap"
{
:dependencies ["theHamsta/nvim-dap-virtual-text"
               (tx "rcarriga/nvim-dap-ui" {:dependencies ["nvim-neotest/nvim-nio"]})]
:config (fn [] (do 
        (let [dap (require :dap)]

            (set dap.adapters.gdb {
                 :type "executable"
                 :command "gdb"
                 :args ["-i" "dap"]})
            (set dap.configurations.cpp [
                 {:name "Launch"
                  :type "gdb"
                  :request "launch"
                  :program (fn [] (vim.fn.input "Path to executable: " (.. (vim.fn.getcwd) "/") "file"))
                  :cwd "${workspaceFolder}"
                  :stopOnEntry true
                  :args {}
                 }
                 {:name "Attach"
                  :type "gdb"
                  :request "attach"
                  :pid (fn [] (vim.fn.input "PID to attach to: "))
                  :cwd "${workspaceFolder}"
                 }
                 ])

            (vim.keymap.set "n" "<F5>" dap.continue)
            (vim.keymap.set "n" "<F10>" dap.step_over)
            (vim.keymap.set "n" "<S-F10>" dap.step_back)
            (vim.keymap.set "n" "<F11>" dap.step_into)
            (vim.keymap.set "n" "<S-F11>" dap.step_out)
            (vim.keymap.set "n" "<F12>" dap.toggle_breakpoint)

            ((. (require :dapui) :setup))
            ((. (require :nvim-dap-virtual-text) :setup)))))

:enabled true})
