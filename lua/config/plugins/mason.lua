return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup {
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
            }
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup()
        end,
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        config = function()
            require("mason-tool-installer").setup {
                ensure_installed = {
                    "lua-language-server",
                    "marksman",
                    "prettier",
                    "pyright",
                    "isort",
                    "flake8",
                    "autopep8",
                    "blue",
                    "stylua",
                },
            }
        end,
    },
}
