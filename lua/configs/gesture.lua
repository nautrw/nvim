local gesture = require "gesture"

gesture.register {
    name = "scroll to bottom",
    inputs = { gesture.down(), gesture.up() },
    action = "normal! G",
}

gesture.register {
    name = "scroll to top",
    inputs = { gesture.up(), gesture.down() },
    action = "normal! gg",
}

gesture.register {
    name = "go back one page",
    inputs = { gesture.right(), gesture.left() },
    action = function()
        vim.api.nvim_feedkeys(vim.keycode "<C-o>", "n", true)
    end,
}

gesture.register {
    name = "go forward one page",
    inputs = { gesture.left(), gesture.right() },
    action = function()
        vim.api.nvim_feedkeys(vim.keycode "<C-i>", "n", true)
    end,
}
