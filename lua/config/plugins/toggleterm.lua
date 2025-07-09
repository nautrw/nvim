return {
    {
        "akinsho/toggleterm.nvim",
        config = function()
            require("toggleterm").setup {
                direction = "vertical",
                size = 75,
            }
        end,
    },
}
