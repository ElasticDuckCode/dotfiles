;; fennel-ls: macro-file
;; [nfnl-macro]

;; Macros

;; source: https://mentalquill.com/posts/fennel-as-neovim-config/
(fn tx [& args]
  "Mixed sequential and associative tables at compile time. Because the Neovim ecosystem loves them but Fennel has no neat way to express them"
  (let [to-merge (when (table? (. args (length args)))
                   (table.remove args))]
    (if to-merge
      (do
        (each [key value (pairs to-merge)]
          (tset args key value))
        args)
      args)))

{: tx}
