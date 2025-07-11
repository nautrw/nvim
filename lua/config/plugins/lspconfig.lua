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

            local on_attach = function(client, bufnr)
                if client.server_capabilities.inlayHintProvider then
                    vim.lsp.inlay_hint.enable(true)
                end
            end

            for _, lsp in ipairs(servers) do
                lspconfig[lsp].setup {
                    capabilities = capabilities,
                    on_attach = on_attach,
                }
            end

            lspconfig["basedpyright"].setup {
                capabilities = capabilities,
                on_attach = on_attach,
                settings = {
                    basedpyright = {
                        analysis = {
                            typeCheckingMode = "basic",
                        },
                    },
                },
            }

            vim.diagnostic.config { update_in_insert = true }
        end,
    },
}
