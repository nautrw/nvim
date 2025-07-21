return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "saghen/blink.cmp",
            {
                "folke/lazydev.nvim",
                opts = {
                    library = {
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
        },
        config = function()
            local capabilities = require("blink.cmp").get_lsp_capabilities()
            local lspconfig = require "lspconfig"

            local servers = { "lua_ls" }

            for _, lsp in ipairs(servers) do
                lspconfig[lsp].setup {
                    capabilities = capabilities,
                    on_attach = on_attach,
                }
            end

            vim.lsp.config("basedpyright", {
                settings = {
                    ["basedpyright"] = {
                        analysis = {
                            typeCheckingMode = "standard",
                        },
                        python = {
                            venvPath = "./.venv",
                        },
                    },
                },
            })
            vim.diagnostic.config { update_in_insert = true }
        end,
    },
}
