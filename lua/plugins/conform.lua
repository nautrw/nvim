return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  opts = {
    notify_on_error = true,
    formatters_by_ft = {
      lua = { 'stylua' },
      python = { 'black', 'isort' },
      c = { 'clang-format' },
      cpp = { 'clang-format' },
    },
  },
}
