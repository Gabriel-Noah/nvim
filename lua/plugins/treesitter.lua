---@diagnostic disable: missing-fields
return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            highlight = { enable = true },
            indent = { enable = true },
            rainbow = {
                enable = true,
            },
        })
        -- Disables treesitter indentation in typst files
        vim.api.nvim_create_autocmd("BufEnter", { pattern = "*.typ", command = "TSDisable indent" })
    end,
}
