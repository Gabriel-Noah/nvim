return {
    "OXY2DEV/markview.nvim",
    lazy = false,
    priority = -1000,
    config = function()
        require("markview").setup({
            typst = {
                enable = false,
            },
        })
    end,
}
