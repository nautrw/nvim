return {
    {
        "stevearc/conform.nvim",
        event = "BufWritePre", -- format on save
        config = function()
            require "configs.conform"
        end,
    },
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                -- Lua
                "lua-language-server",
                "stylua",
                -- Python
                "basedpyright",
                "ruff",
            },
        },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "lua",
                "vimdoc",
                "vim",
            },
        },
    },
    {
        "mfussenegger/nvim-lint",
        config = function()
            require "configs.nvim-lint"
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = "pmizio/typescript-tools.nvim",

        config = function()
            require("nvchad.configs.lspconfig").defaults()
            require "configs.lspconfig"
        end,
    },
    {
        "kdheepak/lazygit.nvim",
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
}
