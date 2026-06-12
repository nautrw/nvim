return {
  'fmbarina/multicolumn.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    sets = {
      lua = {
        scope = 'file',
        rulers = { 81 },
        always_on = true,
        full_column = true,
        to_line_end = true,
      },
      python = {
        scope = 'window',
        rulers = { 80 },
        always_on = true,
        to_line_end = true,
        full_column = true,
      },
      c = {
        scope = 'window',
        rulers = { 81 },
        always_on = true,
        to_line_end = true,
        full_column = true,
      },
      cpp = {
        scope = 'window',
        rulers = { 81 },
        always_on = true,
        to_line_end = true,
        full_column = true,
      },
    },
  },
}
