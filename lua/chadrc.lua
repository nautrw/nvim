-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "oxocarbon",
}

M.ui = {
    tabufline = {
        enabled = false, -- bufferlines give me anxiety
    },
    nvdash = {
        load_on_startup = true,
        header = {
            "Gloria al Padre, y al Hijo, y al Espíritu Santo;",
            "Como era en el principio, ahora, y siempre, por ",
            "los siglos de los siglos.",
            "",
            "────── 🕇 ──────",
            "",
            "Glory be to the Father, and to the Son, and to the",
            "Holy Spirit. As it was in the beginning, is now,",
            "and shall ever be, world without end.",
            "",
            "Amen.",
        },
    },
    statusline = {
        theme = "vscode_colored",
    },
}

return M
