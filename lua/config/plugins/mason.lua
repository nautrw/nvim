return {
    {
        "williamboman/mason-lspconfig.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
        },
    },
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        dependencies = {
            "WhoIsSethDaniel/mason-tool-installer.nvim",
        },
        config = function()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "",
                        package_pending = "",
                        package_uninstalled = "",
                    },
                },
            })

            require("mason-tool-installer").setup({
                ensure_installed = {
                    "basedpyright",
                    "black",
                    "isort",
                    "debugpy",
                    "lua-language-server",
                    "stylua",
                    "xmlformatter",
                    "typescript-language-server",
                    "prettier",
                },
            })

            require("mason-lspconfig").setup()

            vim.lsp.config("lua-language-server", {
                settings = {
                    Lua = {
                        runtime = {
                            version = "LuaJIT",
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                        hint = { enable = true }
                    },
                },
            })

            vim.lsp.config("basedpyright", {
                settings = {
                    basedpyright = {
                        analysis = {
                            autoSearchPaths = true,
                            useLibraryCodeForTypes = true,
                            typeCheckingMode = "standard",
                            inlayHints = {
                                callArgumentNames = true,
                                genericTypes = true,
                                variableTypes = true,
                                functionReturnTypes = true,
                            }
                        },
                        python = {
                            venvPath = "./.venv",
                        },
                    },
                }
            })

            vim.diagnostic.config({
                virtual_text = false,
                underline = true,
                update_in_insert = true,
                signs = {
                    active = true,
                    text = {
                        [vim.diagnostic.severity.ERROR] = "",
                        [vim.diagnostic.severity.WARN]  = "",
                        [vim.diagnostic.severity.HINT]  = "󰟃",
                        [vim.diagnostic.severity.INFO]  = "",
                    },
                },
            })
        end,
    },
}

