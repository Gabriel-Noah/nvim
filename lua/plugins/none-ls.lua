return {
    "nvimtools/none-ls.nvim",
    config = function()
        -- Refered to as null ls because thats the old version of the plugin
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                -- null_ls.builtins.formatting.clang_formatter,
            },
        })

        vim.keymap.set("n", "<leader>gq", vim.lsp.buf.format)
    end,
}
