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
            "formatters_and_linters",
            "lsp_msg",
            "%=",
            "diagnostics",
            "lsp",
            "cursor",
            "cwd",
        },
        modules = {
            formatters_and_linters = function()
                local clients = {}

                local formaters = require("conform").list_formatters(0)
                for _, formatter in ipairs(formaters) do
                    table.insert(clients, formatter.name)
                end

                local linters = require("lint").get_running(0)
                if #linters > 0 then
                    for _, linter in ipairs(linters) do
                        table.insert(clients, linter)
                    end
                end

                return "%#Your_Custom_Highlight#" .. table.concat(clients, ", ")
            end,
            -- conform_progress = function()
            --     local formatters = require("conform").list_formatters()

            --     for k, v in pairs(formatters) do
            --         print(k)
            --         print(v)
            --     end
            --     return "a"
            --     --if #formatters == 0 then
            --     --     return ""
            --     -- end
            --     --return "󰃣" .. table.concat(formatters, ", ")
            -- end,
            -- lint_progress = function()
            --     local linters = require("lint").get_running()
            --     if #linters == 0 then
            --         return ""
            --     end
            --     return "󱉶 " .. table.concat(linters, ", ")
            -- end,
        },
    },
    tabufline = {
        enabled = false,
    },
}

return M
