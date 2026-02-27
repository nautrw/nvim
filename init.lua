vim.loader.enable()

require("config.options")
require("config.keymap")
require("config.lazy")
require("config.persistent_colorscheme")

vim.diagnostic.config {
    virtual_text = false,
    underline = true,
    update_in_insert = true,
    signs = {
        active = true,
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.HINT] = "󰟃",
            [vim.diagnostic.severity.INFO] = "",
        },
    },
}

vim.lsp.enable("lua_ls")
vim.lsp.enable("basedpyright")
