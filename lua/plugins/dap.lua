return {
    "mfussenegger/nvim-dap",
    dependencies = { "rcarriga/nvim-dap-ui", "nvim-neotest/nvim-nio" },
    config = function ()
        local dap = require("dap")

        -- Keybinds
        vim.keymap.set("n", "<F5>", dap.continue)
        vim.keymap.set("n", "<F10>", dap.step_over)
        vim.keymap.set("n", "<F11>", dap.step_into)
        vim.keymap.set("n", "<F12>", dap.step_out)
        vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint)
        vim.keymap.set({"n", "v"}, "<Leader>dh", function () require("dap.ui.widgets").hover() end)
        vim.keymap.set({"n", "v"}, "<Leader>dp", function () require("dap.ui.widgets").preview() end)
    end
}
