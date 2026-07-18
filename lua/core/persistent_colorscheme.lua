if pcall(function() vim.cmd.colorscheme("carbonfox") end) then
  return
else
  vim.cmd.colorscheme("paradise")
  print("Failed to load colorscheme `carbonfox`")
end