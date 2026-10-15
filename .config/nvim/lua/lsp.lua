local navic = require("nvim-navic")
local navbuddy = require("nvim-navbuddy")

require("mason").setup({
	ui = {
		icons = {
			package_installed = "",
			package_pending = "",
			package_uninstalled = "",
		},
	},
	ensure_installed = {
		"clangd",
		"cssls",
		"dockerls",
		"docker_compose_language_service",
		"emmet_ls",
		"graphql",
		"html",
		"jsonls",
		"lua_ls",
		"remark_ls",
		"ruby_lsp",
		"sqlls",
		"svelte",
		"taplo",
		"templ",
		"yamlls",
		"ols",
		"gdscript",
		"gopls",
		"tailwindcss",
		"ts_ls",
		"lua_ls",
		"rust_analyzer",
	},
})

local on_attach = function(client, bufnr)
	if client.server_capabilities.documentSymbolProvider then
		navic.attach(client, bufnr)
		navbuddy.attach(client, bufnr)
	end
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config('clangd', {
    capabilities = capabilities
})
vim.lsp.config('cssls', {
    capabilities = capabilities
})
vim.lsp.config('dockerls', {
    capabilities = capabilities
})
vim.lsp.config('docker_compose_language_service', {
    capabilities = capabilities
})
vim.lsp.config('emmet_ls', {
    capabilities = capabilities
})
vim.lsp.config('graphql', {
    capabilities = capabilities
})
vim.lsp.config('html', {
    capabilities = capabilities
})
vim.lsp.config('jsonls', {
    capabilities = capabilities
})
vim.lsp.config('lua_ls', {
    capabilities = capabilities
})
vim.lsp.config('remark_ls', {
    capabilities = capabilities
})
vim.lsp.config('ruby_lsp', {
    capabilities = capabilities
})
vim.lsp.config('sqlls', {
    capabilities = capabilities
})
vim.lsp.config('svelte', {
    capabilities = capabilities
})
vim.lsp.config('taplo', {
    capabilities = capabilities
})
vim.lsp.config('templ', {
    capabilities = capabilities
})
vim.lsp.config('yamlls', {
    capabilities = capabilities
})
vim.lsp.config('ols', {
    capabilities = capabilities
})
vim.lsp.config('gdscript', {
    capabilities = capabilities
})


vim.lsp.config('gopls', {
	on_attach = on_attach,
	capabilities = capabilities,
})

vim.lsp.config('tailwindcss', {
	cmd = { "tailwindcss-language-server", "--stdio" },
	filetypes = {
		"html",
		"css",
		"scss",
		"svelte",
		"rust",
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
	},
	capabilities = capabilities,
})

vim.lsp.config('ts_ls', {
	init_options = {
		hostInfo = "neovim",
		preferences = {
			includeCompletionsForModuleExports = true,
			includeCompletionsForImportStatements = true,
			importModuleSpecifierPreference = "relative",
		},
	},
	capabilities = capabilities,
	on_attach = on_attach,
})

vim.lsp.config('lua_ls', {
	settings = {
		Lua = {
			workspace = {
				library = {
					"${3rd}/love2d/library",
				},
			},
		},
	},
	capabilities = capabilities,
	on_attach = on_attach,
})

vim.lsp.config('rust_analyzer', {
	settings = {
		["rust-analyzer"] = {
			diagnostics = {
				disabled = { "unresolved-proc-macro" },
			},
		},
	},
	on_attach = on_attach,
})

navbuddy.setup({})

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		rust = { "rustfmt" },
		go = { "goimports", "gofmt" },
		templ = { "templ" },
        typescriptreact = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        svelte = { "prettier" },
	},
})
