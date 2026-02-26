return {
    "williamboman/mason.nvim",
    cmd = "Mason",
    dependencies = {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "jay-babu/mason-nvim-dap.nvim",
    },
    config = function()
        require("mason").setup { ui = {
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
                "xmlformatter",
                "typescript-language-server",
                "prettier",
            },
        }
            end,
}
