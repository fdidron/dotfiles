-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        -- LSP
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
        "stevearc/conform.nvim",
        -- Treesitter
        { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
        { "slim-template/vim-slim" },
        -- UI
        {
            "rachartier/tiny-inline-diagnostic.nvim",
            event = "VeryLazy", -- Or `LspAttach`
            priority = 1000, -- needs to be loaded in first
            config = function()
                require('tiny-inline-diagnostic').setup()
                vim.diagnostic.config({ virtual_text = false }) -- Only if needed in your configuration, if you already have native LSP diagnostics
            end
        },
        { "Shatur/neovim-ayu" },
        -- Notifications
        { "j-hui/fidget.nvim", opts = {} },
        {
            "nvim-lualine/lualine.nvim",
            dependencies = { "nvim-tree/nvim-web-devicons" },
        },
        {
            "nvim-telescope/telescope.nvim",
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
        -- Completion
        { "hrsh7th/nvim-cmp" },
        "hrsh7th/cmp-nvim-lsp",
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets",
        {
            "supermaven-inc/supermaven-nvim",
        },
        -- Motions
        "smoka7/hop.nvim",
        -- Auto Pairs
        {
            "windwp/nvim-autopairs",
            event = "InsertEnter",
            config = true,
        },
        -- Indent indicator
        { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
        -- Symbols navigator
        {
            "SmiteshP/nvim-navic",
            dependencies = { "neovim/nvim-lspconfig" },
        },
        {
            "hasansujon786/nvim-navbuddy",
            dependencies = { 
                "neovim/nvim-lspconfig",
                "SmiteshP/nvim-navic",
                "MunifTanjim/nui.nvim",
                "numToStr/Comment.nvim",
                "nvim-telescope/telescope.nvim",
            },
        },
        -- mu: music composition as code (~/dev/mu)
        {
            dir = vim.fn.expand("~/dev/mu/editors/nvim"),
            name = "mu",
            ft = "mu",
            opts = {},
        }
    },
})

-- update plugins on every start
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        require("lazy").update({ show = false })
    end,
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
