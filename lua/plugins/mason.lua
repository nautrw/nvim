return {
  'williamboman/mason.nvim',
  cmd = 'Mason',
  dependencies = {
    {
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      opts = {
        ensure_installed = {
          'basedpyright',
          'black',
          'isort',
          'debugpy',
          'lua-language-server',
          'stylua',
          'xmlformatter',
          'typescript-language-server',
          'prettier',
        },
      },
    },
  },
  opts = {
    ui = {
      icons = {
        package_installed = '',
        package_pending = '',
        package_uninstalled = '',
      },
    },
  },
}
