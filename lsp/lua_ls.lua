return {
    cmd = { "lua-language-server" },
    root_markers = {
		"lazy-lock.json",
		".luarc.json",
		".luarc.jsonc",
		".luacheckrc",
		".stylua.toml",
		"stylua.toml",
		"selene.toml",
		"selene.yml",
		".git",
		"default.nix",
	},
    settings = {
        basedpyright = {
            analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                typeCheckingMode = "standard",
                inlayHints = {
                    callArgumentNames = true,
                    genericTypes = true,
                    variableTypes = true,
                    functionReturnTypes = true,
                },
            },
            python = {
                venvPath = "./.venv",
            },
        },
    },
}
