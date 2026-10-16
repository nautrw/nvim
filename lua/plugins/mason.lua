return {
  'williamboman/mason.nvim',
  cmd = 'Mason',
  dependencies = {
    {
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      opts = {
        ensure_installed = {
          'ty',
          'ruff',
          'debugpy',
          'lua-language-server',
          'stylua',
          'xmlformatter',
          'typescript-language-server',
          'prettier',
          'clangd',
          'clang-format',
          'codelldb',
          "shfmt"
        },
      },
    },
  },
  opts = {
    ui = {
      icons = {
        package_installed = '',
        package_pending = '',
        package_uninstalled = '',
      },
    },
  },
}
