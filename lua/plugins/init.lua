return {
    {
        "stevearc/conform.nvim",
        -- event = 'BufWritePre', -- uncomment for format on save
        config = function()
            require "configs.conform"
        end,
    },
    {
        'williamboman/mason.nvim',
        opts = {
            ensure_installed = {
                -- Lua
                "lua-language-server",
                'stylua'
            }
        }
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                'lua',
                'vimdoc',
                'vim'
            }
        }
    }
}
