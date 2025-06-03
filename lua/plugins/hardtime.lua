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
            disabled_keys = {
                -- Changes arrow keys to only be disabled in normal mode
                ["<Up>"] = { "n" },
                ["<Left>"] = { "n" },
                ["<Right>"] = { "n" },
                ["<Down>"] = { "n" },
            },
        })
    end,
}
