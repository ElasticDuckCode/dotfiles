;; indentation
(set vim.opt.tabstop 4)
(set vim.opt.softtabstop 4)
(set vim.opt.shiftwidth 4)
(set vim.opt.expandtab true)
(set vim.opt.autoindent true)
(set vim.opt.smartindent true)

;; undo file
(set vim.opt.swapfile false) ;;not once have I needed them, yet they annoy me always
(set vim.opt.undodir
     (.. (os.getenv "HOME") "/.local/share/nvim/undodir"))
(set vim.opt.undofile true)

;; remember cursor position
(vim.api.nvim_create_autocmd  ["BufReadPost"]
                              {
                              :pattern ["*"]
                              :callback (fn [] (vim.api.nvim_exec2 "silent! normal! g`\"zv" {:output true}))})

;; line wrapping
(set vim.opt.wrap true)
(set vim.opt.linebreak true)
(set vim.o.showbreak "⤷ ")

;; number/sign/cursor line
(set vim.opt.number false)
(set vim.wo.signcolumn "yes")

;; screensplits
(set vim.opt.splitright true)
(set vim.opt.splitbelow true)

;; buffers
(set vim.opt.hidden true)

;; scrolling
(set vim.opt.scrolljump 0)
(set vim.opt.scrolloff 8)

;; statusline
(set vim.opt.showmode true)
(set vim.opt.laststatus 3)

;; search
(set vim.opt.hlsearch false)
(set vim.opt.incsearch true)

;; update time
(set vim.opt.updatetime 50)

;; netrw
(set vim.g.netrw_browse_split 0)
(set vim.g.netrw_banner 0)

;; errors/warnings
(let [signs {:Error " "
             :Warn " " 
             :Hint " "
             :Info " "}]
  (each [type icon (pairs signs)]
    (let [hl (.. "DiagnosticSign" type)]
      (vim.fn.sign_define hl {:text icon :texthl hl :numhl hl}))))

(vim.diagnostic.config {:signs {
                          :text {vim.diagnostic.severity.ERROR " "
                                 vim.diagnostic.severity.WARN " "
                                 vim.diagnostic.severity.HINT " "
                                 vim.diagnostic.severity.INFO " "}
                        :linehl {vim.diagnostic.severity.ERROR "ErrorMsg"}
                        :numhl {vim.diagnostic.severity.WARN "WarningMsg"}}
                        :virtual_text {:current_line true}
                        :virtual_lines false})

