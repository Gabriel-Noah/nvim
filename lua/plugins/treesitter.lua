return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = { "lua", "python", "c", "cpp", "make", "javascript", "java", "rust" },
            highlight = { enable = true },
            indent = { enable = true },
            rainbow = {
                enable = true,
            },
        })
    end
}
