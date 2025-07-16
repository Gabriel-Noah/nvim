-- Setting Stuff
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set autoindent")
vim.cmd("set mouse=a")
vim.cmd("set nowrap")
vim.cmd("set mousemoveevent")

-- Mapping Stuff
vim.cmd("noremap <SPACE> <Nop>")
vim.g.mapleader = " "

vim.cmd("inoremap kj <Esc>")
-- disabled the visual varient because it was pissing me off
-- vim.cmd("vnoremap kj <Esc>")
vim.cmd("nnoremap <Enter> o<Esc>")
vim.cmd("nnoremap <Backspace> O<Esc>")
vim.cmd("noremap H ^") -- can be ^ or 0
vim.cmd("noremap L $")
vim.cmd("noremap K H")
vim.cmd("noremap J L")

vim.cmd('noremap <leader>y "+y')
vim.cmd('noremap <leader>p "+p')
vim.cmd("map <ScrollWheelUp> <C-y>")
vim.cmd("map <ScrollWheelDown> <C-e>")
vim.cmd("nnoremap <leader>w :w<CR>")

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

vim.diagnostic.config({ virtual_text = true })

-- Shows trailing whitespace and tab characters
vim.cmd("set list")
vim.cmd("set listchars=tab:>-,trail:-,nbsp:+")
