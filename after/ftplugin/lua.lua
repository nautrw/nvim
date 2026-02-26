vim.lsp.config("lua-language-server", {
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            hint = { enable = true },
        },
    },
})

vim.lsp.enable("lua-language-server")
