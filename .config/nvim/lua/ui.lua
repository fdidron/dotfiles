local ibl = require('ibl')
local navic = require('nvim-navic')
vim.cmd('colorscheme ayu-mirage')

-- Lualine
local lualine = require('lualine')

local config = {
    theme = "ayu",
    sections = {
        lualine_c = {
            {
                function()
                    return navic.get_location()
                end,
                cond = function()
                    return navic.is_available()
                end
            }
        }
    }
}

lualine.setup(config)

ibl.setup({})
