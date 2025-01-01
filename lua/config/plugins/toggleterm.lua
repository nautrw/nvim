return {
    {
        "akinsho/toggleterm.nvim",
        config = function()
            require("toggleterm").setup {
                direction = "vertical",
                size = 40,
            }
        end,
    },
}
