return {
    'stevearc/oil.nvim',
    config = function ()
        require("oil").setup()
        vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
        -- Uses Oil if nvim is ran with no arguments
        if vim.fn.argv(0) == '' and not vim.v.argv[3] == '+Man!' then vim.cmd('Oil') end
    end
}
