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
    automatic_enabled = true,
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
        "ols",
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
        "yamlls"
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
lsp.remark_ls.setup({ capabilities = capabilities })
lsp.ruby_lsp.setup({ capabilities = capabilities })
lsp.rust_analyzer.setup({ capabilities = capabilities })
lsp.sqlls.setup({ capabilities = capabilities })
lsp.svelte.setup({ capabilities = capabilities })
lsp.taplo.setup({ capabilities = capabilities })
lsp.templ.setup({ capabilities = capabilities })
lsp.yamlls.setup({ capabilities = capabilities })
lsp.ols.setup({ capabilities = capabilities })
lsp.gdscript.setup({capabilities = capabilities})

lsp.tailwindcss.setup({
    cmd = { "tailwindcss-language-server", "--stdio" },
    filetypes = { "html", "css", "scss", "svelte", "rust", "javascript", "javascriptreact", "typescript", "typescriptreact" },
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
    capabilities = capabilities
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
})

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

vim.diagnostic.config({
  virtual_text = true,
  virtual_lines = { current_line = true },
  underline = true,
  update_in_insert = false
})

local og_virt_text
local og_virt_line

vim.api.nvim_create_autocmd({ 'CursorMoved', 'DiagnosticChanged' }, {
  group = vim.api.nvim_create_augroup('diagnostic_only_virtlines', {}),
  callback = function()
    if og_virt_line == nil then
      og_virt_line = vim.diagnostic.config().virtual_lines
    end

    -- ignore if virtual_lines.current_line is disabled
    if not (og_virt_line and og_virt_line.current_line) then
      if og_virt_text then
        vim.diagnostic.config({ virtual_text = og_virt_text })
        og_virt_text = nil
      end
      return
    end

    if og_virt_text == nil then
      og_virt_text = vim.diagnostic.config().virtual_text
    end

    local lnum = vim.api.nvim_win_get_cursor(0)[1] - 1

    if vim.tbl_isempty(vim.diagnostic.get(0, { lnum = lnum })) then
      vim.diagnostic.config({ virtual_text = og_virt_text })
    else
      vim.diagnostic.config({ virtual_text = false })
    end
  end
})

vim.api.nvim_create_autocmd('ModeChanged', {
  group = vim.api.nvim_create_augroup('diagnostic_redraw', {}),
  callback = function()
    pcall(vim.diagnostic.show)
  end
})
