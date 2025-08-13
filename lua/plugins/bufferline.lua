return {
    "akinsho/bufferline.nvim",
    config = function()
        vim.opt.termguicolors = true
        local bufferline = require("bufferline")
        bufferline.setup({
            options = {
                style_preset = bufferline.style_preset.minimal,
                hover = {
                    enabled = true,
                    delay = 50,
                    reveal = { "close" },
                },
                always_show_bufferline = false,
                diagnostics = "nvim_lsp",
            },
        })
        vim.keymap.set("n", "<leader>q", bufferline.close_with_pick)
    end,
}
