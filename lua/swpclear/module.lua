-- module represents a lua module for the plugin
local M = {}

local api = vim.api
local buf, win

M.my_first_function = function()

print("nasi")
  buf = api.nvim_create_buf(false, true) -- create new emtpy buffer
  local git_log_output = api.nvim_call_function("system", { 'git log -n 30 --oneline' })
  local git_logs = vim.split(git_log_output, "\n")
  api.nvim_buf_set_lines(buf, 0, -1, true, git_logs)
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
