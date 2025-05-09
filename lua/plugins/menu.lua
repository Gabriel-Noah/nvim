return {
    "nvzone/menu",
    dependencies = { "nvzone/volt" },
    config = function()
        vim.keymap.set("n", "<leader>t", function()
            require("menu").open("default")
        end, {})
    end,
}
