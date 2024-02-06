-- Setting Stuff vim.cmd("set number")
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
vim.cmd("nnoremap <Backspace> O<Esc>")
vim.cmd("nnoremap L $")
vim.cmd("nnoremap H ^")
vim.cmd("nnoremap K H")
vim.cmd("nnoremap J L")

vim.cmd('noremap <leader>y "+y')
vim.cmd('noremap <leader>p "+p')

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
    { "Mofiqul/vscode.nvim" },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    { "m4xshen/autoclose.nvim" },
    { "tpope/vim-commentary" },
    { "tpope/vim-surround" },
    { "ThePrimeagen/vim-be-good" },
    { "MunifTanjim/nui.nvim" },
    { "folke/noice.nvim" },
    { "rcarriga/nvim-notify" },
    { "folke/tokyonight.nvim" },
    {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'}
}
local opts = {}

require("lazy").setup(plugins, opts)

-- Plug in stuff
-- require("onedark").load()
-- require("vscode").load()
vim.cmd[[colorscheme tokyonight]]

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})

local configs = require("nvim-treesitter.configs")
configs.setup({
	ensure_installed = { "lua", "python", "c", "cpp", "make", "javascript" },
	highlight = { enable = true },
	indent = { enable = true },
	rainbow = {
		enable = true,
	},
})

require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
})

require("bufferline").setup{}
require("autoclose").setup()
