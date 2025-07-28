local hp = require('harpoon')
-- Catpuccin should be installed in the plugins.lua file
require('ayu').setup({
    mirage = true,
})

vim.cmd('colorscheme ayu')

-- Lualine
local lualine = require('lualine')

local config = {
    theme = "ayu",
}

lualine.setup(config)

hp.setup({
    settings = {
        save_on_toggle = true,
    }
})
