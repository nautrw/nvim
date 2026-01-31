return {
    "rubiin/fortune.nvim",
    config = function()
        require("fortune").setup {
            display_format = "mixed",
            content_type = "mixed",
        }
    end,
}
