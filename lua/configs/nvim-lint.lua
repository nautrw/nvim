require("lint").linters_by_ft = {
    lua = { "selene" },
    python = { "ruff" },
    c = { "cpplint" },
    cpp = { "cpplint" },
    sql = { "sqlfluff" },
    js = { "quick-lint-js" },
    html = { "htmlhint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = function()
        require("lint").try_lint()
    end,
})
