local M = {
  base00 = '#151515',
  base01 = '#292929',
  base02 = '#3B3B3B',
  base03 = '#505050',
  base04 = '#C5C0C0',
  base05 = '#E8E3E3',
  base06 = '#E8E3E3',
  base07 = '#E8E3E3',
  base08 = '#B66467',
  base09 = '#D9BC8C',
  base0A = '#D9BC8C',
  base0B = '#8C977D',
  base0C = '#8AA6A2',
  base0D = '#8DA3B9',
  base0E = '#A988B0',
  base0F = '#BBB6B6',
}

require('base16-colorscheme').setup(M)

vim.api.nvim_set_hl(0, 'WinSeparator', {
  fg = M.base03,
})
