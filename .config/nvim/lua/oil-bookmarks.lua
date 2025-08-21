local M = {}
local oil = require("oil")

local function read_bookmarks_file(root_path)
    local bookmarks = {}
    local bookmarks_file = root_path .. "/bookmarks.oil"
    local file = io.open(bookmarks_file, "r")

    if file then
        for line in file:lines() do
            local name, path = string.match(line, "%s*(%S+)%s+(%S+)")
            if name and path then
                table.insert(bookmarks, { name = name, path = path })
            end
        end
        file:close()
    end

    return bookmarks
end

local options = {
    display = "append", -- append, prepend, toggle
    mappings = {
        jump = "g",
        display = "<leader>b",
    }
}

local function register_bookmark_shortcuts(buffer, bookmarks)
    for i, bookmark in ipairs(bookmarks) do
        vim.keymap.set("n", options.mappings.jump .. i, function()
            oil.open(bookmark.path, {}, function()
                print("Bookmark " .. bookmark.name .. " >> " .. bookmark.path)

            end)
        end, { buffer = buffer })
    end
end

function M.setup(opts)
    options = vim.tbl_deep_extend("force", options, opts or {})
    vim.api.nvim_create_autocmd({ "FileType" }, {
        pattern = { "oil" },
        callback = function()
            local buffer = vim.api.nvim_get_current_buf()
            vim.api.nvim_create_autocmd({ "BufEnter" }, {
                buffer = buffer,
                callback = function()
                    local root_path = vim.fn.getcwd()
                    local bookmarks = read_bookmarks_file(root_path)

                    register_bookmark_shortcuts(buffer, bookmarks)
                end
            })
        end
    })
end

return M
