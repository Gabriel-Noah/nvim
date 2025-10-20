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
        -- Disabling it for typst in the setup isn't enough
        vim.api.nvim_create_autocmd("BufEnter", {
            pattern = "*.typ",
            command = "Markview disable",
        })
    end,
}
