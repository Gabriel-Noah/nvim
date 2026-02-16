return {
    "alexghergh/nvim-tmux-navigation",
    config = function ()
        require("nvim-tmux-navigation").setup({
            keybindings = {
                left = "<M-h>",
                down = "<M-j>",
                up = "<M-k>",
                right = "<M-l>",
            }
        })
    end
}
