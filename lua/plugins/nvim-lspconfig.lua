return {
    "neovim/nvim-lspconfig",
    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        vim.lsp.config("pyright", {
            capabilities = capabilities,
        })

        vim.lsp.config("tinymist", {
            capabilities = capabilities,
            settings = {
                formatterMode = "typstyle",
            },
        })
    end,
}
