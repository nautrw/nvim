local null_ls = require('null-ls')

local formatting = null_ls.builtins.formatting
local format_ag = vim.api.nvim_create_augroup('LspFormatting', {})
local lint = null_ls.builtins.diagnostics

local opts = {
    sources = {
        -- Python
        formatting.black,
        lint.mypy,
        lint.ruff,
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({
                group = format_ag,
                buffer = bufnr,
            })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = format_ag,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end,
}

return opts
