local M = {}

M.base_30 = {
  white = "#fcfcfa",
  darker_black = "#221f22", -- Filetree background
  black = "#2d2a2e", -- background
  black2 = "#19181a", -- selected file in filetree
  one_bg = "#2d2c23", -- background 
  one_bg2 = "#2e2a2e", -- Scope background? Ex: "M.base_39 =" at top
  one_bg3 = "#221f22", -- Mode background
  grey = "#727072", -- line numbers
  grey_fg = "#727072", -- comments
  grey_fg2 = "#939293", -- Whatever this is idk
  light_grey = "#ab9df2", -- Grey text in the statusline
  statusline_bg = "#221f22", -- Statusline bg
  line = "#403e41", -- for lines like vertsplit
  red = "#ff6188",
  baby_pink = "#ffb0c3",
  pink = "#ff88a6",
  green = "#a9dc76",
  vibrant_green = "#bee59d",
  nord_blue = "#9ae5ee",
  blue = "#78dce8",
  yellow = "#ffd866",
  sun = "#fc9867",
  purple = "#ab9df2",
  dark_purple = "#7e68eb",
  teal = "#1a8996",
  orange = "#fc9867",
  cyan = "#78dce8",
  lightbg = "#403e41", -- Idk wtf this is either
  pmenu_bg = "#939293", -- Selected item in the completion popups
  folder_bg = "#939293", -- folder bg
  lavender = "#e6e2fb",
}

M.base_16 = {
  base00 = "#2e2a2e", -- Default Background
  base01 = "#403e31", -- Lighter Background (Used for status bars, line number and folding marks)
  base02 = "#939293", -- Selection Background
  base03 = "#727072", -- Comments, Invisibles, Line Highlighting
  base04 = "#2e2a2e", -- Dark Foreground (Used for status bars)
  base05 = "#fcfcfa", -- Default Foreground, Caret, Delimiters, Operators
  base06 = "#221f22", -- Light foreground
  base07 = "#fcfcfa", -- Light background
  base08 = "#fcfcfa", -- Variables
  base09 = "#ab9df2", -- Integers
  base0A = "#78dce8", -- Classes
  base0B = "#ffd866", -- Strings
  base0C = "#ab9df2", -- Brackets
  base0D = "#a9dc76", -- Functions
  base0E = "#ff6188", -- Keywords
  base0F = "#403e41", -- Opening/Closing Embedded Language Tags, e.g. <?php ?>
}

M.polish_hl = {
    ['@operator'] = { fg = '#ff6188' },
    ['@constructor'] = { fg = '#ff6188' },
    ['@parameter'] = { fg = '#fc9867' },
    ['@punctuation.delimiter'] = { fg = '#fcfcfa' },
    ['@keyword'] = { fg = '#78dce8' },
    ['@keyword.function'] = { fg = '#78dce8' },
    ['@function'] = { fg = '#a9dc76' },
    ['@constructor.python'] = { fg = '#a9dc76' },
    ['@variable.builtin'] = { fg = '#727072' },
    ['@punctuation.bracket'] = { fg = '#ff6188' },
}

M.type = "dark"

return M
