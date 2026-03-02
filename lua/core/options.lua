vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.o.relativenumber = true
vim.o.signcolumn = 'auto'

vim.o.mouse = 'a'

vim.o.expandtab = true
vim.o.smartindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4

-- Don't show mode in gutter
vim.o.showmode = false

-- Inside schedule because it might increase startup times
vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)

-- Preserve horizontal blocks; indent wrapped lines
vim.o.breakindent = true

vim.o.swapfile = false
vim.o.undofile = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.list = true
-- Fillchars show generally thoughought nvim
vim.opt.fillchars = {
  eob = ' ', -- Supress `~` at the end of a file
}
-- Listchars show inside the buffer
vim.opt.listchars = {
  tab = '» ',
  trail = '·',
  nbsp = '␣', -- U+202F
}

vim.o.cursorline = true

-- Ask to save file instead of throwing error due to unsaved changes
vim.o.confirm = true

vim.o.termguicolors = true

-- Universal statusline
vim.o.laststatus = 3

vim.o.winborder = 'rounded'

-- Keep an amount of lines above and below the cursor
vim.o.scrolloff = 10

vim.opt.whichwrap:append '<>[]hl'

vim.opt.laststatus = 3
