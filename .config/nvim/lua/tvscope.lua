-- called this module tvscope instead of telescope since it would clash
-- against the telescope's plugin module.
local t = require("telescope")
local themes = require("telescope.themes")

t.setup({
    extensions = {
        ["ui-select"] = {
            themes.get_cursor {
            }
        }
    }
})

t.load_extension "ui-select"
