-- Setting Stuff vim.cmd("set number")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set autoindent")
vim.cmd("set mouse=a")
vim.cmd("set nowrap")

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

-- Rename symbol keymaps
vim.keymap.set("n", "gr", vim.lsp.buf.rename)

-- Clears / register
vim.cmd("noremap <leader>/ :call setreg('/', '')<CR>")

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
    { "folke/tokyonight.nvim" },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

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
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    { "neovim/nvim-lspconfig" },
    {
        "hrsh7th/nvim-cmp",
        dependencies = { "hrsh7th/cmp-buffer", "hrsh7th/cmp-path" , "hrsh7th/cmp-nvim-lsp" }
    },
    {
        "williamboman/mason.nvim",
        dependencies = { "williamboman/mason-lspconfig.nvim" }
    },
    { 'stevearc/oil.nvim' },
}
local opts = {}

require("lazy").setup(plugins, opts)

-- Plug in stuff
-- require("onedark").load()
-- require("vscode").load()
-- vim.cmd[[colorscheme tokyonight]]
vim.cmd.colorscheme "catppuccin-mocha"

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})

local configs = require("nvim-treesitter.configs")
configs.setup({
	ensure_installed = { "lua", "python", "c", "cpp", "make", "javascript", "java" },
	highlight = { enable = true },
	indent = { enable = true },
	rainbow = {
		enable = true,
	},
})

-- Buffer based file thingy
require("oil").setup()
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
-- Uses Oil if nvim is ran with no arguments
if vim.fn.argv(0) == '' then vim.cmd('Oil') end

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

require("autoclose").setup()
require('lualine').setup {
    options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
        statusline = {},
        winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
    }
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename', 'tabs'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {''},
        lualine_z = {'location'}
    },
        inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
  extensions = {}
}

-- lsp stuff
require("mason").setup()
local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup({
    ensure_installed = {
        --[[
        get servers from this link to avoid headache
        https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers
        --]]
        "lua_ls",   --lua
        "pyright",  --python
        "clangd",   -- c/c++
        "jdtls",     -- java
    },
    automatic_installation = true
})

local cmp = require('cmp')
cmp.setup({
    -- snippet = { expand = function() end },
    completion = {
        completeopt = "menu,menuone,preview,noinsert"
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<Tab>"] = cmp.mapping.confirm({ select=false })
    }),
    sources = cmp.config.sources({
        { name = "buffer" },
        { name = "nvim_lsp" },
        { name = "path" }
    }),
})
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lspconfig = require('lspconfig')
lspconfig.pyright.setup{
    capabilities = capabilities
}

lspconfig.lua_ls.setup{
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }  -- stops errors in vim lua files
            }
        }
    }
}

lspconfig.clangd.setup{}

lspconfig.jdtls.setup{}
