return {
    "Olical/conjure",
    ft = { "clojure", "lisp", "scheme", "fennel" },
    enabled = true,
    init = function()
        vim.g["conjure#filetype#scheme"] = "conjure.client.guile.socket"
        vim.g["conjure#client#guile#socket#pipename"] = "/tmp/guile-repl.socket"
    end
}
