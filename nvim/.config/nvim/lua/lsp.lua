local lsp = require("lspconfig")
local none_ls = require("null-ls")

require("mason").setup({
	ui = {
		icons = {
			package_installed = "",
			package_pending = "",
			package_uninstalled = "",
		},
	},
})

require("mason-lspconfig").setup({
	ensure_installed = {
		"clangd",
		"cssls",
		"dockerls",
		"docker_compose_language_service",
		"emmet_ls",
		"gopls",
		"graphql",
		"html",
		"jsonls",
		"lua_ls",
		"ts_ls",
		"remark_ls",
		"ruby_lsp",
		"rust_analyzer",
		"sqlls",
		"svelte",
		"taplo",
		"tailwindcss",
		"templ",
		"yamlls",
	},
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

lsp.clangd.setup({ capabilities = capabilities })
lsp.cssls.setup({ capabilities = capabilities })
lsp.dockerls.setup({ capabilities = capabilities })
lsp.docker_compose_language_service.setup({ capabilities = capabilities })
lsp.emmet_ls.setup({ capabilities = capabilities })
lsp.gopls.setup({ capabilities = capabilities })
lsp.graphql.setup({ capabilities = capabilities })
lsp.html.setup({ capabilities = capabilities })
lsp.jsonls.setup({ capabilities = capabilities })
lsp.lua_ls.setup({ capabilities = capabilities })
lsp.ts_ls.setup({ capabilities = capabilities })
lsp.remark_ls.setup({ capabilities = capabilities })
lsp.ruby_lsp.setup({ capabilities = capabilities })
lsp.rust_analyzer.setup({ capabilities = capabilities })
lsp.sqlls.setup({ capabilities = capabilities })
lsp.svelte.setup({ capabilities = capabilities })
lsp.taplo.setup({ capabilities = capabilities })
lsp.templ.setup({ capabilities = capabilities })
lsp.yamlls.setup({ capabilities = capabilities })

lsp.tailwindcss.setup({
cmd = { "tailwindcss-language-server", "--stdio" },
filetypes = { "html", "css", "scss", "svelte", "rust", "javascript", "javascriptreact", "typescript", "typescriptreact" },
capabilities = capabilities,
})

--local servers = {
--	lua_ls = {},
--	clangd = {},
--	cssls = {},
--	dockerls = {},
--	docker_compose_language_service = {},
--	emmet_ls = {},
--	gopls = {},
--	graphql = {},
--	html = {},
--	jsonls = {},
--	ts_ls = {},
--	remark_ls = {},
--	ruby_lsp = {},
--	rust_analyzer = {},
--	sqlls = {},
--	svelte = {},
--	taplo = {},
--	templ = {},
--	yamlls = {},
--}
--
--for server, config in pairs(servers) do
--	config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
--	lsp[server].setup(config)
--end

lsp.rust_analyzer.setup({
    settings = {
        ["rust-analyzer"] = {
            diagnostics = {
                disabled = { "unresolved-proc-macro" },
            },
        },
    },
})


local fmt = none_ls.builtins.formatting
none_ls.setup({
	sources = {
		fmt.clang_format,
		fmt.erb_format,
		fmt.gofmt,
		fmt.stylua,
		fmt.prettierd.with({
			extra_filetypes = { "svelte" },
		}),
	},
})
