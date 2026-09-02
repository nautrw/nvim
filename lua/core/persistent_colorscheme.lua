if pcall(function() vim.cmd.colorscheme("embark") end) then
  return
else
  vim.cmd.colorscheme("paradise")
  print("Failed to load colorscheme `embark`")
end