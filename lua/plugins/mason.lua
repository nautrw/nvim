return {
	"williamboman/mason.nvim",
	cmd = "Mason",
	dependencies = {
		{
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			opts = {
		ensure_installed = {
			"basedpyright",
			"black",
			"isort",
			"debugpy",
			"lua-language-server",
			"stylua",
			"xmlformatter",
			"typescript-language-server",
			"prettier",
		},

			}
		},
		"jay-babu/mason-nvim-dap.nvim",
	},
	opts = {
		ui = {
			icons = {
				package_installed = "",
				package_pending = "",
				package_uninstalled = "",
			},
		},
	}
}
