require("lint").linters_by_ft = {
  python = { "mypy", "ruff" },
  lua = { "selene" },
}

-- The following is so that it will triggers
-- the linter when leaving InsertLeave.
-- It might not work with some linters, because
-- some linters require writing to disk rather
-- than just stdin output.
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
