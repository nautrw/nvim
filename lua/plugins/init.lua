return {
    {
        "stevearc/conform.nvim",
        event = "BufWritePre",
        opts = require "configs.conform",
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "vim",
                "vimdoc",
                "lua",
                "python",
            },
        },
    },
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
    },
    {
        "kdheepak/lazygit.nvim",
        lazy = false,
    },
    {
        "notomo/gesture.nvim",
        config = function()
            require "configs.gesture"
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        config = function()
            require "configs.nvim-tree"
        end,
    },
}
