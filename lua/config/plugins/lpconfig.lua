return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
        { "folke/lazydev.nvim", ft = "lua" },
    },
    config = function()
        local lspconfig = require "lspconfig"
        local mason_lspconfig = require "mason-lspconfig"
        local cmp_nvim_lsp = require "cmp_nvim_lsp"

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                vim.keymap.set(
                    "n",
                    "gR",
                    "<cmd>Telescope lsp_references<CR>",
                    { buffer = ev.buf, silent = true, desc = "Show definition and references" }
                )
                vim.keymap.set(
                    "n",
                    "gD",
                    vim.lsp.buf.declaration,
                    { desc = "Go to declaration", buffer = ev.buf, silent = true }
                )
                vim.keymap.set(
                    "n",
                    "gd",
                    "<cmd>Telescope lsp_definitions<CR>",
                    { desc = "Show LSP definitions", buffer = ev.buf, silent = true }
                )
                vim.keymap.set(
                    "n",
                    "gi",
                    "<cmd>Telescope lsp_implementations<CR>",
                    { buffer = ev.buf, silent = true, desc = "Show LSP implementations" }
                )
                vim.keymap.set(
                    "n",
                    "gt",
                    "<cmd>Telescope lsp_type_definitions<CR>",
                    { buffer = ev.buf, silent = true, desc = "Show LSP type definitions" }
                )
                vim.keymap.set(
                    { "n", "v" },
                    "<leader>ca",
                    vim.lsp.buf.code_action,
                    { buffer = ev.buf, silent = true, desc = "See available code actions" }
                )
                vim.keymap.set(
                    "n",
                    "K",
                    vim.lsp.buf.hover,
                    { buffer = ev.buf, silent = true, desc = "Show documentation for what is under cursor" }
                )
                vim.keymap.set(
                    "n",
                    "<leader>rs",
                    ":LspRestart<CR>",
                    { buffer = ev.buf, silent = true, desc = "Restart LSP" }
                )
            end,
        })

        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- Default configurations
        local servers = { "lua_ls", "marksman", "pyright" }

        for _, lsp in ipairs(servers) do
            lspconfig[lsp].setup {
                capabilities = capabilities,
            }
        end
    end,
}
