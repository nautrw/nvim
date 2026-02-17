vim.g.mapleader = " "

vim.opt.clipboard = "unnamedplus"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.fillchars = {
    vert = "│",
    eob = " ", -- Supress `~` at the end of a file
}

vim.opt.whichwrap:append "<>[]hl" -- Lets h and l move to previous or next line

vim.opt.undofile = true
vim.opt.swapfile = false

-- vim.opt.relativenumber = true -- Necessary for statuscol
vim.opt.number = true
vim.opt.signcolumn = "auto"

vim.opt.cursorline = true

vim.opt.mouse = "a"

vim.opt.termguicolors = true

vim.opt.laststatus = 3 -- Universal statusline

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.winborder = "rounded"

vim.opt.ignorecase = true
vim.opt.smartcase = true
