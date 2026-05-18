return {
  'williamboman/mason.nvim',
  cmd = 'Mason',
  dependencies = {
    {
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      opts = {
        ensure_installed = {
          'ty',
          'black',
          'isort',
          'debugpy',
          'lua-language-server',
          'stylua',
          'xmlformatter',
          'typescript-language-server',
          'prettier',
          'clangd',
          'clang-format',
          'codelldb'
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
