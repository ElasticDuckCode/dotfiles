return {
    {
        "Olical/conjure",
        ft = { "clojure", "fennel", "scheme", "lisp" },
        config = function()
            --vim.g["conjure#filetype#scheme"] = "conjure.client.guile.socket"
            --vim.g["conjure#client#guile#socket#pipename"] = "/tmp/guile-repl.socket"
        end,
        dependencies = { "PaterJason/cmp-conjure" },
        enabled = true
    },
}
