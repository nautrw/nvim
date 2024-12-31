local Menu = require("nui.menu")
local event = require("nui.utils.autocmd").event

function choose_colorscheme(name)
    vim.cmd("colorscheme " .. name)
    file = io.open("lua/config/persistent_colorscheme.lua", 'w')
    file:write("vim.cmd('colorscheme " .. name .. "'" .. ")")
    file:close()
end

line_options = {}
-- that getcompletion() breaks if i add anything else, so I will not do anything else
for k, option in ipairs(vim.fn.getcompletion("colo ", "cmdline")) do
    table.insert(line_options, Menu.item(option))
end

local popup_options = {
  position = "50%",
  size = {
      width = 25,
      height = 5,
  },
  border = {
    style = "single",
    text = {
      top = "Choose Colorscheme",
      top_align = "center",
    },
  },
  win_options = {
    winhighlight = "Normal:Normal",
  }
}

local menu = Menu(popup_options, {
  lines = line_options,
  max_width = 20,
  keymap = {
    focus_next = { "j", "<Down>", "<Tab>" },
    focus_prev = { "k", "<Up>", "<S-Tab>" },
    close = { "<Esc>", "<C-c>" },
    submit = { "<CR>", "<Space>" },
  },
  on_change = function(item, menu)
      vim.cmd("colorscheme " .. item.text)
  end,
  on_submit = function(item)
      choose_colorscheme(item.text)
  end,
})

function spawn_menu()
    menu:mount()
end
