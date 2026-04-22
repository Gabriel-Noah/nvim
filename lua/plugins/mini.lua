return {
    "echasnovski/mini.nvim",
    config = function()
        require("mini.ai").setup()
        vim.cmd("imap <S-tab> <Esc>cinb") -- Mapping using mini ai
        require("mini.comment").setup()
        require("mini.splitjoin").setup()
        require("mini.surround").setup()
        require("mini.completion").setup()
    end,
}
