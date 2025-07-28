--[[
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.slim = {
  install_info = {
    url = "~/dev/tree-sitter-slim/", -- local path or git repo
    files = {"src/parser.c", "src/scanner.cc"}, -- note that some parsers also require src/scanner.c or src/scanner.cc
    -- optional entries:
    branch = "main", -- default branch in case of git repo if different from master
    generate_requires_npm = false, -- if stand-alone parser without npm dependencies
    requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
  },
  filetype = "slim", -- if filetype does not match the parser name
}

-- Treesitter Plugin Setup
require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"html",
		"go",
		"typescript",
		"javascript",
		"svelte",
		"ruby",
		"json",
        "slim",
		"yaml",
		"bash",
		"lua",
		"rust",
		"toml",
	},
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	ident = { enable = true },
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	},
})
]]
