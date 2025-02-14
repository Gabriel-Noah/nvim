-- Mapping Stuff
vim.cmd("noremap <SPACE> <Nop>")
vim.g.mapleader = " "

vim.cmd("inoremap kj <Esc>")
vim.cmd("vnoremap kj <Esc>")
vim.cmd("nnoremap <Enter> o<Esc>")
vim.cmd("nnoremap <Backspace> O<Esc>")
vim.cmd("noremap H ^")  -- can be ^ or 0
vim.cmd("noremap L $")
vim.cmd("noremap K H")
vim.cmd("noremap J L")

vim.cmd('noremap <leader>y "+y')
vim.cmd('noremap <leader>p "+p')
vim.cmd('map <ScrollWheelUp> <C-y>')
vim.cmd('map <ScrollWheelDown> <C-e>')
vim.cmd('nnoremap <leader>w :w<CR>')

-- Rename symbol keymap
vim.keymap.set("n", "gr", vim.lsp.buf.rename)

-- Clears / register
vim.cmd("noremap <leader>/ :call setreg('/', '')<CR>")
