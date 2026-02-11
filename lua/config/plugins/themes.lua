return {
    {
        "RRethy/base16-nvim",
        lazy = false,
        config = function()
            require("base16-colorscheme").with_config {
                telescope = true,
                indentblankline = true,
                ts_rainbow = true,
                cmp = true,
                dapui = true,
            }
        end,
    },
}
