local builtin = require("telescope.builtin")
local hp = require("harpoon")

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

-- Harpoon
vim.keymap.set("n", "<Leader>ha", function() hp:list():add() end)
vim.keymap.set("n", "<Leader>hh", function() hp.ui:toggle_quick_menu(hp:list()) end)
vim.keymap.set("n", "<Leader>h1", function() hp:list():select(1) end)
vim.keymap.set("n", "<Leader>h2", function() hp:list():select(2) end)
vim.keymap.set("n", "<Leader>h3", function() hp:list():select(3) end)
vim.keymap.set("n", "<Leader>h4", function() hp:list():select(4) end)
vim.keymap.set("n", "<Leader>hk", function() hp:list():prev() end)
vim.keymap.set("n", "<Leader>hj", function() hp:list():next() end)

-- LSP
vim.keymap.set("n", "gj", vim.lsp.buf.hover, {})
vim.keymap.set("n", "g.", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "gk", vim.lsp.buf.definition, {})
vim.keymap.set("n", "g;", vim.lsp.buf.format, {})

-- Hop Hop
vim.keymap.set("n", "<Leader>s", require("hop").hint_words, {})

-- Quit all
vim.keymap.set("n", "<Leader>qq", ":qa<CR>", {})

-- Terminal
vim.keymap.set("n", "-", ":Floaterminal<CR>", {})


