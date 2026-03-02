return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  cmd = { 'LspInfo', 'LspInstall', 'LspUninstall' },
  dependencies = {
    { 'mason-org/mason-lspconfig.nvim', opts = {} },
    { 'j-hui/fidget.nvim', opts = {} },
  },
  config = function()
    vim.diagnostic.config {
      update_in_insert = true,
      severity_sort = true,
      float = { border = 'rounded', source = 'if_many' },
      virtual_text = false,
      signs = {
        active = true,
        text = {
          [vim.diagnostic.severity.ERROR] = '',
          [vim.diagnostic.severity.WARN] = '',
          [vim.diagnostic.severity.HINT] = '󰟃',
          [vim.diagnostic.severity.INFO] = '',
        },
      },
      -- Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
      jump = { float = true },
    }

    vim.lsp.config('lua_ls', {
      root_markers = {
        'lazy-lock.json',
        '.luarc.json',
        '.luarc.jsonc',
        '.luacheckrc',
        '.stylua.toml',
        'stylua.toml',
        'selene.toml',
        'selene.yml',
        '.git',
        'default.nix',
      },
      settings = {
        basedpyright = {
          analysis = {
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
            typeCheckingMode = 'standard',
            inlayHints = {
              callArgumentNames = true,
              genericTypes = true,
              variableTypes = true,
              functionReturnTypes = true,
            },
          },
          python = {
            venvPath = './.venv',
          },
        },
      },
    })
  end,
}
