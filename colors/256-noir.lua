require('base16-colorscheme').setup {
  base00 = '#080808',
  base01 = '#121212',
  base02 = '#1c1c1c',
  base03 = '#454545',
  base04 = '#585858',
  base05 = '#bcbcbc',
  base06 = '#d0d0d0',
  base07 = '#eeeeee',
  base08 = '#bcbcbc',
  base09 = '#d70000',
  base0A = '#d0d0d0',
  base0B = '#8a8a8a',
  base0C = '#585858',
  base0D = '#8a8a8a',
  base0E = '#bcbcbc',
  base0F = '#585858',
}

vim.api.nvim_set_hl(0, '@function', { fg = '#eeeeee', bold = true })
vim.api.nvim_set_hl(0, '@type', { fg = '#eeeeee', bold = true })
vim.api.nvim_set_hl(0, '@variable', { fg = '#eeeeee', bold = true })
vim.api.nvim_set_hl(0, 'Title', { fg = '#eeeeee', bold = true })
vim.api.nvim_set_hl(0, 'Directory', { fg = '#eeeeee', bold = true })
vim.api.nvim_set_hl(0, 'MoreMsg', { fg = '#eeeeee', bold = true })
