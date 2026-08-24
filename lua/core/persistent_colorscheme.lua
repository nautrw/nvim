if pcall(function() vim.cmd.colorscheme("duskfox") end) then
  return
else
  vim.cmd.colorscheme("paradise")
  print("Failed to load colorscheme `duskfox`")
end