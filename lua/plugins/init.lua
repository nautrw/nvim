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
                "selene",
                -- Python
                "basedpyright",
                "ruff",
                -- C/C++
                "clangd",
                "clang-format",
                "cpplint",
                -- SQL
                "sqls",
                "sqlfluff",
                "sql-formatter",
                -- HTML/CSS/JavaScript
                "prettier",
                "html-lsp",
                "stylelint",
                "css-lsp",
                "quick-lint-js",
                "typescript-language-server",
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
                "c",
                "cpp",
                "sql",
                "javascript",
                "css",
                "html",
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
