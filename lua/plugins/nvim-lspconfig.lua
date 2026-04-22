return {
    "neovim/nvim-lspconfig",
    config = function()
        vim.lsp.config("tinymist", {
            settings = {
                formatterMode = "typstyle",
            },
        })
    end,
}
