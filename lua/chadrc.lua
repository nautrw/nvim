-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
    theme = "flexoki",
    nvdash = {
        load_on_startup = true,
        header = {
            [[ El corazón tranquilo da vida al cuerpo. [✝] Proverbios 14:30 ]],
        },
    },
    statusline = {
        theme = "vscode_colored",
        order = {
            "mode",
            "file",
            "git",
            "%=",
            "lsp_msg",
            "%=",
            "diagnostics",
            "lsp",
            "formatters",
            "linters",
            "cursor",
            "cwd",
        },
        modules = {
            formatters = function()
                local clients = {}

                local formatters = require("conform").list_formatters(0)

                if #formatters == 0 then
                    return "%#nothing#󱝱 "
                end

                for _, formatter in ipairs(formatters) do
                    table.insert(clients, formatter.name)
                end

                return "%#nothing#󰃣 " .. table.concat(clients, ", ")
            end,
            linters = function()
                local linters = require("lint").get_running()
                if #linters == 0 then
                    return " %#nothing# "
                end
                return " %#nothing#  " .. table.concat(linters, ", ")
            end,
        },
    },
    tabufline = {
        enabled = false,
    },
}

return M
