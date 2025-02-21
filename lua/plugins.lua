return {
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
    { 'akinsho/bufferline.nvim' },
}
