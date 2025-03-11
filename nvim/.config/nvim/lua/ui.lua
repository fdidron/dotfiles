local hp = require('harpoon')
-- Catpuccin should be installed in the plugins.lua file
vim.cmd.colorscheme "catppuccin-mocha"

-- Lualine
local lualine = require('lualine')

local config = {
    theme = "catppuccin",
}

lualine.setup(config)

hp.setup({
    settings = {
        save_on_toggle = true,
    }
})
