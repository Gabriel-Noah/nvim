return {
    "neovim/nvim-lspconfig",
    config = function ()
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        local lspconfig = require('lspconfig')
        lspconfig.pyright.setup{
            capabilities = capabilities
        }

        lspconfig.lua_ls.setup{
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' }  -- stops errors in vim lua files
                    }
                }
            }
        }

        lspconfig.clangd.setup{}

        lspconfig.jdtls.setup{}

        lspconfig.rust_analyzer.setup{}

        lspconfig.vtsls.setup{}
    end
}
