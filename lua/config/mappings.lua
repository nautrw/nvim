local whichkey = require "which-key"
local fff = require "fff"
local gitsigns = require "gitsigns"
local dap = require "dap"

-- Mappings groups
whichkey.add {
    { "<leader>s", desc = "Split management" },
    { "<leader>t", desc = "Themes & Terminals" },
    { "<leader>f", desc = "Find" },
    { "<leader>g", desc = "Git" },
    { "<leader>gh", desc = "Hunks" },
    { "<leader>gb", desc = "Buffers" },
    { "<leader>d", desc = "Debugging & Diagnostics" },
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

vim.keymap.set("n", "<Leader>e", "<cmd>Oil<CR>", { desc = "Open Oil file manager" }) -- Oil's mappings are in lua/config/plugins/oil.lua

vim.keymap.set("n", "<leader>c", ":nohl<CR>", { desc = "Clear search highlights" })

vim.keymap.set("i", "<C-BS>", "<C-o>db", { desc = "Ctrl+Backspace" })

vim.keymap.set("n", "<Leader>th", "<cmd>Telescope colorscheme_chooser<CR>", { desc = "Open theme selector" })
vim.keymap.set("n", "<Leader>ff", function()
    fff.find_files()
end, { desc = "Find files using FFF" })

vim.keymap.set("n", "<Leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Find text using telescope live grep" })

vim.keymap.set("n", "<leader>ghs", gitsigns.stage_hunk, { desc = "Stage hunk" })
vim.keymap.set("n", "<leader>gbs", gitsigns.stage_buffer, { desc = "Stage everything in the buffer" })
vim.keymap.set("n", "<leader>ghr", gitsigns.reset_hunk, { desc = "Reset hunk" })
vim.keymap.set("n", "<leader>gbr", gitsigns.reset_buffer, { desc = "Reset everything in the buffer" })

vim.keymap.set("n", "<leader>df", vim.diagnostic.open_float, { desc = "Show diagnostics in a float" })

vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue debugging" })
vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step into" })
vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Step over" })
vim.keymap.set("n", "<leader>du", dap.step_out, { desc = "Step out" })
vim.keymap.set("n", "<leader>dq", function()
    dap.terminate()
    require("dapui").close()
    require("nvim-dap-virtual-text").toggle()
end, { desc = "Quit dap" })

vim.keymap.set("n", "<leader>te", "<cmd>ToggleTerm<CR>", { desc = "Open terminal" })
vim.keymap.set("t", "<C-esc>", "<C-\\><C-N>", { desc = "Exit toggleterm" })

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new { cmd = "lazygit", direction = "float", hidden = true }

function _lazygit_toggle()
    lazygit:toggle()
end

vim.keymap.set("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>", { desc = "Open LazyGit inside terminal" })

vim.api.nvim_create_user_command("Sw", "SudaWrite", {})
vim.api.nvim_create_user_command("Sr", "SudaRead", {})
