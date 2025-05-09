return {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()
        require("hardtime").setup({
            disable_mouse = false,
            disabled_filetypes = {
                "qf",
                "netrw",
                "NvimTree",
                "lazy",
                "mason",
                "oil",
                "markdown",
                "alpha",
                "NvMenu",
                "help",
            },
        })
    end,
}
