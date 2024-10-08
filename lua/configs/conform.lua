local options = {
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff_format", "ruff_organize_imports" },
        xml = { "xmlformat" },
        sql = { "sqlfmt" },
    },
    format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
    },
}

return options
