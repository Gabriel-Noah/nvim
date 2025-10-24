-- Options
vim.o.number = true
vim.o.relativenumber = true
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.autoindent = true
vim.o.mouse = "a"
vim.o.wrap = false
vim.o.mousemoveevent = true
vim.diagnostic.config({ virtual_text = true })

-- Shows trailing whitespace and tab characters
vim.o.list = true
vim.o.listchars = "tab:>-,trail:-,nbsp:+"

-- Keymaps
vim.g.mapleader = " "
vim.keymap.set({ "n", "v", "x" }, "<SPACE>", "<Nop>")
vim.keymap.set("i", "kj", "<Esc>")
vim.keymap.set("n", "<Enter>", "o<Esc>")
vim.keymap.set("n", "<Backspace>", "O<Esc>j")
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p')
vim.keymap.set({ "n", "v" }, "<ScrollWheelUp>", "<C-y>")
vim.keymap.set({ "n", "v" }, "<ScrollWheelDown>", "<C-e>")
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>bn", function()
    vim.cmd("bn")
end)
vim.keymap.set("n", "<leader>bp", function()
    vim.cmd("bp")
end)

-- Enables spell checking in certain file types
vim.api.nvim_create_autocmd("BufEnter", { pattern = { "*.md", "*.txt", "*.typ" }, command = "set spell" })

-- Opens github short links in the browser in the same way gx opens full links in the browser
vim.keymap.set("n", "<leader>gx", function()
    vim.ui.open("https://github.com/" .. vim.fn.expand("<cfile>"))
end)

-- LSP Keymaps
vim.keymap.set("n", "gr", vim.lsp.buf.rename)
vim.keymap.set("n", "gh", vim.lsp.buf.hover)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)

-- Disables search highlight
vim.keymap.set("n", "<Esc>", function()
    vim.cmd("noh")
end)
