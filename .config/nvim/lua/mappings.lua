local builtin = require("telescope.builtin")
local conform = require("conform")

-- Alt-tab between the two last opened buffers
vim.keymap.set("n", "<Leader><Tab>", "<C-^>")

-- Window navigation
vim.keymap.set("n", "<c-h>", "<C-w>h")
vim.keymap.set("n", "<c-j>", "<C-w>j")
vim.keymap.set("n", "<c-k>", "<C-w>k")
vim.keymap.set("n", "<c-l>", "<C-w>l")

-- Window creation
vim.keymap.set("n", "<Leader><Leader>j", "<C-w>s")
vim.keymap.set("n", "<Leader><Leader>l", "<C-w>v")

-- Telescope bindings
vim.keymap.set("n", "<Leader>f", builtin.find_files, {})
vim.keymap.set("n", "<Leader>d", builtin.buffers, {})
vim.keymap.set("n", "<Leader>g", builtin.live_grep, {})
vim.keymap.set("n", "<Leader>;", builtin.commands, {})
vim.keymap.set("n", "<Leader>j", ":Oil <CR>", {})
vim.keymap.set("n", "<Leader>v", ":Neogit<CR>", {})

-- LSP
vim.keymap.set("n", "gj", vim.lsp.buf.hover, {})
vim.keymap.set("n", "g.", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "gk", vim.lsp.buf.definition, {})
vim.keymap.set("n", "g;", conform.format, {})
vim.keymap.set("n", "g/", vim.diagnostic.open_float, {})
vim.keymap.set("n", "<Leader>e", vim.diagnostic.goto_next, {})
vim.keymap.set("n", "<Leader>E", vim.diagnostic.goto_prev, {})
vim.keymap.set("n", "<Leader>a", ":Navbuddy<CR>", {})

-- Copilot Chat
vim.keymap.set("n", "gi", ":CopilotChatToggle<CR>", {})

-- Hop Hop
vim.keymap.set("n", "<Leader>s", require("hop").hint_words, {})

-- Quit all
vim.keymap.set("n", "<Leader>qq", ":qa<CR>", {})

-- Ctrl + Backspace
--vim.keymap.set("i", "<C-BS>", "<C-w>")

