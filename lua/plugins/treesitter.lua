---@diagnostic disable: missing-fields
return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").install({
            "lua",
            "python",
            "c",
            "cpp",
            "java",
            "javascript",
            "typescript",
            "typst",
            "markdown",
            "rust",
            "json",
            "make",
            "bash",
        })

        -- Runs whenever a buffer is opened
        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                -- Gets the language for the filetype
                local lang = vim.treesitter.language.get_lang(args.match)
                if lang then
                    -- If lang is not installed this silently fails
                    pcall(vim.treesitter.start, args.buf, lang)
                end
            end,
        })
    end,
}
