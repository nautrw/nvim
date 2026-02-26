vim.api.nvim_buf_set_keymap(0, 'n', '<leader>p', 'yiwoprint(<esc>pa)<esc>', { desc = "Print-debug", noremap = true, silent = true })

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
                },
            },
            python = {
                venvPath = "./.venv",
            },
        },
    },
})

vim.lsp.enable("basedpyright")
