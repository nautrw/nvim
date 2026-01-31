return {
    "stevearc/conform.nvim",
    config = function()
        require("conform").setup {
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "isort", "black" },
                xml = { "xmlformat" },
            },
            format_on_save = {
                timout_ms = 1000,
                lsp_format = "fallback",
            },
        }
    end,
}
