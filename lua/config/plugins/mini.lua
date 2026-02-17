return {
    "nvim-mini/mini.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("mini.icons").mock_nvim_web_devicons()
    end,
}
