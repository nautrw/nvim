-- Enable faster lua loader using byte-compilation
-- -- https://github.com/neovim/neovim/commit/2257ade3dc2daab5ee12d27807c0b3bcf103cd29
-- -- https://github.com/lewis6991/impatient.nvim#notice
vim.loader.enable()

-- Options
local g = vim.g
local opt = vim.opt

g.mapleader = " "

opt.mouse = 'a'

opt.number = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.smartindent = true
opt.softtabstop = 4
opt.expandtab = true

opt.termguicolors = true
local current_colorscheme = 'noctis_bordo' -- Set colorscheme here

opt.swapfile = false
opt.undofile = true

opt.clipboard = 'unnamedplus'

-- Go to previous/next line with h, j, or arrow keys
-- if cursor is at the end or beginning of line
opt.whichwrap:append "<>[]hl"

vim.opt.laststatus = 2

-- This is a hideous hack to be able to set the colorscheme here
return current_colorscheme
