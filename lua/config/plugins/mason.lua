return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
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
                "lua-language-server",
            },
        }

        require("mason-lspconfig").setup()
    end,
}
