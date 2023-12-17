-- Setting Stuff
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set autoindent")
vim.cmd("set mouse=a")

-- Mapping Stuff
vim.cmd("noremap <SPACE> <Nop>")
vim.g.mapleader = " "
vim.cmd("inoremap kj <Esc>")
vim.cmd("vnoremap kj <Esc>")
vim.cmd("nnoremap <Enter> o<Esc>")
vim.cmd("noremap <leader>y \"+y")
vim.cmd("noremap <leader>p \"+p")

-- Lazy stuff
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
    lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    { "navarasu/onedark.nvim", name = "onedark" },
    {
        "nvim-telescope/telescope.nvim", tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    { "m4xshen/autoclose.nvim" },
    { "tpope/vim-commentary" },
    { "tpope/vim-surround" },
}
local opts = {}

require("lazy").setup(plugins, opts)

-- Plug in stuff
require('onedark').load()

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})

local configs = require("nvim-treesitter.configs")
configs.setup({
    ensure_installed = { "lua", "python", "c", "cpp", "make", "javascript" },
    highlight = { enable = true },
    indent = { enable = true },
})

require("autoclose").setup()
