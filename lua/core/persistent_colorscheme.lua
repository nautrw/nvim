if pcall(function() vim.cmd.colorscheme("cendre") end) then
  return
else
  vim.cmd.colorscheme("paradise")
  print("Failed to load colorscheme `cendre`")
end