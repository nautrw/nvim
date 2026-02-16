return {
    {
        "RRethy/base16-nvim",
        lazy = false,
        priority = 1000,
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
    {
        "aikhe/fleur.nvim",
        lazy = false,
        priority = 1000,
    },
    {
        "ATTron/bebop.nvim",
        lazy = false,
        priority = 1000,
    },
    {
        "atelierbram/Base2Tone-nvim",
        lazy = false,
        priority = 1000,
    },
    {
        "wnkz/monoglow.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    {
        "stevedylandev/darkmatter-nvim",
        lazy = false,
        priority = 1000,
    },
    {
        "vague-theme/vague.nvim",
        lazy = false,
        priority = 1000,
    },
}
