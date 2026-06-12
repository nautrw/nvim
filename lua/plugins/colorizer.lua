return {
  'brenoprata10/nvim-highlight-colors',
  event = 'InsertEnter',
  cmd = { 'HighlightColors', 'ColorizerToggle' },
  opts = {
    render = 'virtual',
    enable_hex = true,
    enable_short_hex = true,
    enable_hsl = true,
    enable_ansi = true,
    enable_xterm256 = true,
    enable_xtermTrueColor = true,
    enable_hsl_without_function = true,
    enable_var_usage = true,
    enable_named_colors = true,
    enable_tailwind = true,
  },
}
