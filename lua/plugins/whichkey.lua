return {
    'folke/which-key.nvim',
    event = 'VimEnter',
    opts = {
      delay = 500,-- delay between pressing a key and opening which-key (milliseconds) 
      icons = { mappings = vim.g.have_nerd_font },
      preset = "helix",
    },
}
