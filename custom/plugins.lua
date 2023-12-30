local plugins = {
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				-- Python
				"pyright",
				"mypy",
				"ruff",
				"blue",
				"isort",
				-- Lua
				"selene",
				"stylua",
				-- C/C++
				"clang-format",
				"clangd",
				"cpplint",
				-- JS/CSS/HTML
				"eslint-lsp",
				"typescript-language-server",
				"html-lsp",
				"css-lsp",
				"prettierd",
				-- SQL
				"sqls",
				"sqlfluff",
				"sql-formatter",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},
	{
		"stevearc/conform.nvim",
		ft = { "python", "lua", "c", "cpp", "html", "css", "javascript", "sql" },
		config = function()
			require("custom.configs.conform")
		end,
	},
	{
		"mfussenegger/nvim-lint",
		ft = { "python", "lua", "c", "cpp", "html", "css", "javascript", "sql" },
		config = function()
			require("custom.configs.nvim-lint")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"json",
				"javascript",
				"typescript",
				"tsx",
				"yaml",
				"html",
				"css",
				"markdown",
				"markdown_inline",
				"bash",
				"lua",
				"vim",
				"dockerfile",
				"gitignore",
				"python",
				"c",
				"cpp",
			},
		},
	},
	{
		"giusgad/pets.nvim",
		dependencies = { "MunifTanjim/nui.nvim", "giusgad/hologram.nvim" },
		lazy = false,
		config = function()
			require("pets").setup()
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
}

return plugins
