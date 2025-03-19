return {
    "williamboman/mason.nvim",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function ()
        require("mason").setup()
        local mason_lspconfig = require("mason-lspconfig")
        mason_lspconfig.setup({
            ensure_installed = {
                --[[
                get servers from this link to avoid headache
                https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers
                --]]
                "lua_ls",           --lua
                "pyright",          --python
                "clangd",           -- c/c++
                "jdtls",            -- java
                "rust_analyzer",    -- rust
                "vtsls",            -- Typescript
            },
            automatic_installation = true
        })
    end
}
