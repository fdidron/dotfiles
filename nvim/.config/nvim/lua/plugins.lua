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
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	"nvimtools/none-ls.nvim",
	-- Debugging
	--   "mfussenegger/nvim-dap",
	--  "yriveiro/dap-go.nvim",
	-- { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
	-- Rust
	"simrat39/rust-tools.nvim",
	-- Treesitter
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ "slim-template/vim-slim" },
	-- UI
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ "j-hui/fidget.nvim", opts = {} },
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
	"nvim-telescope/telescope-ui-select.nvim",
	"lewis6991/gitsigns.nvim",
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
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
	"github/copilot.vim",
	{
		"olimorris/codecompanion.nvim",
		config = true,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
	},
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
	experimental_watch_for_changes = true,
	view_options = {
		show_hidden = true,
	},
	keymaps = {
		["<Esc>"] = "actions.close",
	},
})

require("floaterminal")
