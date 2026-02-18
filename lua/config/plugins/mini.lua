return {
    "nvim-mini/mini.nvim",
    lazy = false,
    config = function()
        require("mini.icons").mock_nvim_web_devicons()
    end,
}
