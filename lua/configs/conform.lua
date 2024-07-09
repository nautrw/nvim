local options = {
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
        c = { "clang-format" },
        cpp = { "clang-format" },
    },

    format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
    },
}

require("conform").setup(options)
