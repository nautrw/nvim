return {
    {
        "williamboman/mason-lspconfig.nvim",
    },
    {
        "williamboman/mason.nvim",
        dependencies = {
            "jay-babu/mason-nvim-dap.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
        },
        config = function()
            require("mason").setup {
                ui = {
                    icons = {
                        package_installed = "",
                        package_pending = "",
                        package_uninstalled = "",
                    },
                },
            }

            require("mason-tool-installer").setup {
                ensure_installed = {
                    "basedpyright",
                    "black",
                    "isort",
                    "debugpy",
                    "lua-language-server",
                    "stylua",
                },
            }

            require("mason-nvim-dap").setup {
                ensure_installed = { "python" },
                automatic_installation = true,
                handlers = {
                    function(config)
                        require("mason-nvim-dap").default_setup(config)
                    end,
                },
            }

            require("mason-lspconfig").setup()
        end,
    },
}
