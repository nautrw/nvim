return {
  "mfussenegger/nvim-lint",
  enable=false,
  config = function()
    require('lint').linters_by_ft = {
      python = {"ruff",},
    }
  end
}
