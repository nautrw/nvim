return {
    "stevearc/conform.nvim",
    config = function()
        require("conform").setup {
            format_on_save = {
                lsp_format = "fallback",
                timeout_ms = 500,
            },
            format_after_save = {
                lsp_format = "fallback",
            },
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "isort", "black", "autopep8" },
                javascript = { "prettier" },
            },
        }
    end,
}
