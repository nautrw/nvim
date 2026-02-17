return {
    "MysticalDevil/inlay-hints.nvim",
    cmd = "InlayHintsToggle",
    dependencies = { "neovim/nvim-lspconfig" },
    opts = {
        commands = {
            enable = true,
        },
        autocmds = {
            enable = false,
        }
    }
}
