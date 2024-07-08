-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
    theme = "flexoki",
    nvdash = {
        load_on_startup = true,
        header = {
            [[ El corazón tranquilo da vida al cuerpo. [✝] Proverbios 14:30 ]]
        },
    },
    statusline = {
        theme = "vscode_colored"
    },
    tabufline = {
        enabled = false,
    }
}

return M
