return {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "hrsh7th/cmp-nvim-lsp" },
    config = function()
        local cmp = require("cmp")
        cmp.setup({
            -- snippet = { expand = function() end },
            completion = {
                completeopt = "menu,menuone,preview,noinsert",
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-k>"] = cmp.mapping.select_prev_item(),
                ["<C-j>"] = cmp.mapping.select_next_item(),
                ["<Tab>"] = cmp.mapping.confirm({ select = false }),
            }),
            sources = cmp.config.sources({
                { name = "buffer" },
                { name = "nvim_lsp" },
                { name = "path" },
            }),
        })
        -- Disables completion on text and markdown files
        vim.api.nvim_create_autocmd("BufEnter", {
            pattern = { "*.md", "*.txt" },
            callback = function()
                cmp.setup.buffer({ enabled = false })
            end,
        })
    end,
}
