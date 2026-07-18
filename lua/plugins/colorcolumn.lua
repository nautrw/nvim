return {
  'fmbarina/multicolumn.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    exclude_ft = { '', 'toggleterm' },
    sets = {
      lua = {
        scope = 'file',
        rulers = { 81 },
        full_column = true,
      },
      python = {
        scope = 'window',
        rulers = { 80 },
        full_column = true,
      },
      c = {
        scope = 'window',
        rulers = { 81 },
        full_column = true,
      },
      cpp = {
        scope = 'window',
        rulers = { 81 },
        full_column = true,
      },
    },
  },
}
