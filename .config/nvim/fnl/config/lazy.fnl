;; Boostrap lazy.nvim
(local lazypath (.. (vim.fn.stdpath "data") "/lazy/lazy.nvim"))
(local lazyrepo "https://github.com/folke/lazy.nvim.git")


(if (not ((. (or vim.uv vim.loop) :fs_stat) lazypath))
 (let [out (vim.fn.system [ "git" "clone" "--filter=blob:none" "--branch=stable" lazyrepo lazypath])]
  (if (~= vim.v.shell_error 0)
        (do (vim.api.nvim_echo [
                            ["Failed to clone lazy.nvim:\n" :ErrorMsg]
                            [out  :WarningMsg]
                            ["\nPress any key to exit..."]]
                           true {})
            (vim.fn.getchar)
            (os.exit 1)))))

(: vim.opt.rtp :prepend lazypath)

((. (require "lazy") :setup)
   {:spec {:import "plugins"}               ;; import your plugins
    :install {:colorscheme ["kanagawa"]}    ;; colorscheme used when installing plugins
    :checker {:enabled true :notify false}  ;; automattically check for updates
   })
