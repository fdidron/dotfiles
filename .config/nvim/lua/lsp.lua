local lsp = require("lspconfig")
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

lsp.clangd.setup({ capabilities = capabilities })
lsp.cssls.setup({ capabilities = capabilities })
lsp.dockerls.setup({ capabilities = capabilities })
lsp.docker_compose_language_service.setup({ capabilities = capabilities })
lsp.emmet_ls.setup({ capabilities = capabilities })
lsp.graphql.setup({ capabilities = capabilities })
lsp.html.setup({ capabilities = capabilities })
lsp.jsonls.setup({ capabilities = capabilities })
lsp.lua_ls.setup({ capabilities = capabilities })
lsp.remark_ls.setup({ capabilities = capabilities })
lsp.ruby_lsp.setup({ capabilities = capabilities })
lsp.sqlls.setup({ capabilities = capabilities })
lsp.svelte.setup({ capabilities = capabilities })
lsp.taplo.setup({ capabilities = capabilities })
lsp.templ.setup({ capabilities = capabilities })
lsp.yamlls.setup({ capabilities = capabilities })
lsp.ols.setup({ capabilities = capabilities })
lsp.gdscript.setup({ capabilities = capabilities })

lsp.gopls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lsp.tailwindcss.setup({
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

lsp.ts_ls.setup({
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

lsp.lua_ls.setup({
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

lsp.rust_analyzer.setup({
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
