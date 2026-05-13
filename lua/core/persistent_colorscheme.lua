if pcall(function() vim.cmd.colorscheme("gruvbox-baby") end) then
  return
else
  vim.cmd.colorscheme("paradise")
  print("Failed to load colorscheme `gruvbox-baby`")
end