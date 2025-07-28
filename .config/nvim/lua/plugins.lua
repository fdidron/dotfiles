-- bootstrap lazy.nvim
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

require("lazy").setup({
    -- LSP
    "williamboman/mason.nvim",
    {
        "williamboman/mason-lspconfig.nvim",
        after = { "mason.nvim", "nvim-lspconfig" }
    },
    {
        "folke/trouble.nvim",
        opts = {},
        cmd = "Trouble"
    },
    "neovim/nvim-lspconfig",
    "nvimtools/none-ls.nvim",
    -- Rust
    "simrat39/rust-tools.nvim",
    -- Treesitter
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    { "slim-template/vim-slim" },
    -- UI
    -- { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    { "Shatur/neovim-ayu" },
    { "j-hui/fidget.nvim",               opts = {} },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    },
    {
        "stevearc/oil.nvim",
        opts = {},
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "JezerM/oil-lsp-diagnostics.nvim",
        dependencies = { "stevearc/oil.nvim" },
        opts = {}
    },
    {
        "benomahony/oil-git.nvim",
        dependencies = { "stevearc/oil.nvim" },
        -- No opts or config needed! Works automatically
    },
    "nvim-telescope/telescope-ui-select.nvim",
    "lewis6991/gitsigns.nvim",
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",  -- required
            "sindrets/diffview.nvim", -- optional - Diff integration

            -- Only one of these is needed, not both.
            "nvim-telescope/telescope.nvim", -- optional
        },
        config = true,
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    -- Completion
    { "hrsh7th/nvim-cmp" },
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
    --"saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    {
        "supermaven-inc/supermaven-nvim",
    },
    --"zbirenbaum/copilot.lua",
    --[[
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            { "zbirenbaum/copilot.lua" },
            { "nvim-lua/plenary.nvim", branch = "master" },
        },
        build = "make tiktoken",
        opts = {
        },
    },
    --]]
    -- Motions
    "smoka7/hop.nvim",
    -- Auto Pairs
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
    },
})

require("hop").setup()

require("gitsigns").setup({})

require("oil").setup({
    default_file_explorer = true,
    columns = {
        "icon",
        "size",
        "mtime",
    },
    view_options = {
        show_hidden = true,
    },
    keymaps = {
        ["<C-j>"] = "actions.close",
        ["<C-;>"] = "actions.refresh",
    },
})

