return {
    "karb94/neoscroll.nvim",
    config = function()
        require("neoscroll").setup({
            mappings = {
                "<C-d>",
                "<C-u>",
                "<C-f>",
                "<C-b>",
                "zz",
            },
            hide_cursor = false,
            duration_multiplier = 0.9,
            ignored_events = {
                "WinScrolled",
                "CursorMoved",
            },
            cursor_scrolls_alone = false,
        })
    end,
}
