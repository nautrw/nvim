vim.loader.enable()
require "config.options"
require "config.lazy"
vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        local float_border = vim.api.nvim_get_hl(0, { name = "FloatBorder" })
        float_border.bg = "none"
        vim.api.nvim_set_hl(0, "FloatBorder", float_border)
    end,
})
require "config.persistent_colorscheme"
require "config.mappings"
