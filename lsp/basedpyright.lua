return {
    cmd = "basedpyright",
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
