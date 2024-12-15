---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "oxocarbon",
    hl_override = {
        ["@variable"] = { fg = "cyan" },
    },
}

M.ui = {
    tabufline = {
        enabled = false, -- bufferlines give me anxiety
    },
    statusline = {
        theme = "vscode_colored",
    },
}

M.nvdash = {
    load_on_startup = true,
    header = {
        "Gloria al Padre, y al Hijo, y al Espíritu Santo;",
        "Como era en el principio, ahora, y siempre, por ",
        "los siglos de los siglos.",
        "",
        "────── ✝ ──────",
        "",
        "Glory be to the Father, and to the Son, and to the",
        "Holy Spirit. As it was in the beginning, is now,",
        "and shall ever be, world without end.",
        "",
        "Amen.",
    },
}

return M
