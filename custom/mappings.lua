local M = {}

M.markdown = {
	n = {
		["<leader>mpt"] = { "<cmd>MarkdownPreviewToggle<CR>", "Toggle the preview of a markdown file" },
		["<leader>mp"] = { "<cmd>MarkdownPreview<CR>", "Preview a markdown file" },
		["<leader>mps"] = { "<cmd>MarkdownPreviewStop<cr>", "Stop the preview of a markdown file" },
	},
}

return M
