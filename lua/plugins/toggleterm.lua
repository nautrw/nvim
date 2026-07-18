return {
  'akinsho/toggleterm.nvim',
  version = '*',
  cmd = { 'ToggleTerm', 'ToggleTermToggleAll', 'TermExec', 'TermNew', 'TermSelect' },
  config = true,
  opts = {
    direction = 'vertical',
    size = vim.o.columns * 0.4
  }
}
