require("conform").setup({
	format_on_save = {
		timeout_ms = 5000,
		lsp_fallback = true,
	},
	formatters_by_ft = {
		python = { "blue", "isort" },
		lua = { "stylua" },
		c = { "clang_format" },
		cpp = { "clang_format" },
		javascript = { "prettierd" },
		css = { "prettier" },
		html = { "prettier" },
		sql = { "sql_formatter" },
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
