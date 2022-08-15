-- module represents a lua module for the plugin
local M = {}

local api = vim.api
local buf, win

M.my_first_function = function()

    buf = api.nvim_create_buf(false, true) -- create new emtpy buffer
    api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')

    local opts = {
        style = "minimal",
        relative = "editor",
        width = 100,
        height = 100,
        row = 0,
        col = 0
    }
    win = api.nvim_open_win(buf, true, opts)
    --
    return "ahello world!"
end

return M
