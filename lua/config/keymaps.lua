local whichkey = require "which-key"
local dap = require "dap"

whichkey.add {
    { "<leader>s", desc = "Split management" },
    { "<leader>t", desc = "Themes" },
    { "<leader>f", desc = "Find" },
    { "<leader>d", desc = "Debugging & LSP" },
}

vim.keymap.set("i", "<A-h>", "<Left>", { desc = "Move cursor left" })
vim.keymap.set("i", "<A-l>", "<Right>", { desc = "Move cursor right" })
vim.keymap.set("i", "<A-j>", "<Down>", { desc = "Move cursor down" })
vim.keymap.set("i", "<A-k>", "<Up>", { desc = "Move cursor up" })
vim.keymap.set("i", "<C-h>", "<Left>", { desc = "Move cursor left" })
vim.keymap.set("i", "<C-l>", "<Right>", { desc = "Move cursor right" })
vim.keymap.set("i", "<C-j>", "<Down>", { desc = "Move cursor down" })
vim.keymap.set("i", "<C-k>", "<Up>", { desc = "Move cursor up" })

vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Focus window to the left" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Focus window to the right" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Focus window to the down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Focus window to the up" })

vim.keymap.set("n", "<leader>c", "<cmd>nohl<CR>", { desc = "Clear search highlights" })

vim.keymap.set("i", "<C-BS>", "<C-w>", { desc = "Ctrl+Backspace" })

vim.keymap.set("n", "<leader>e", "<cmd>Oil<CR>", { desc = "Open Oil" })

vim.keymap.set("n", "<leader>ff", "<cmd>lua Snacks.picker('files')<CR>", { desc = "File picker" })
vim.keymap.set("n", "<leader>fe", "<cmd>lua Snacks.picker()<CR>", { desc = "Every snacks picker" })
vim.keymap.set("n", "<leader>fu", "<cmd>lua Snacks.picker('undo')<CR>", { desc = "Undo history picker" })
vim.keymap.set("n", "<leader>fg", "<cmd>lua Snacks.picker('grep')<CR>", { desc = "Find text" })
vim.keymap.set("n", "<leader>fr", "<cmd>lua Snacks.picker('recent')<CR>", { desc = "Pick recent files" })
vim.keymap.set(
    "n",
    "<leader>fc",
    "<cmd>lua Snacks.picker('files', {cwd = vim.fn.stdpath('config')})<CR>",
    { desc = "Pick files in Neovim Configuration" }
)

vim.keymap.set("n", "<leader>th", function()
    require("config.colorscheme_picker").colorscheme_chooser()
end, { desc = "Choose colorscheme" })

vim.keymap.set("n", "<leader>df", vim.diagnostic.open_float, { desc = "Show diagnostics in a float" })
vim.keymap.set("n", "<leader>iht", "<CMD>InlayHintsToggle<CR>", { desc = "Toggle inlay hints" })
vim.keymap.set("n", "<leader>dc", vim.lsp.buf.hover, { desc = "View documentation on hover" })

vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue debugging" })
vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step into" })
vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Step over" })
vim.keymap.set("n", "<leader>du", dap.step_out, { desc = "Step out" })
vim.keymap.set("n", "<leader>de", require("dapui").open, { desc = "Open Dapui" })
vim.keymap.set("n", "<leader>dq", function()
    dap.terminate()
    require("dapui").close()
    require("nvim-dap-virtual-text").toggle()
end, { desc = "Quit dap" })
