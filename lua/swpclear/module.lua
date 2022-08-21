-- module represents a lua module for the plugin
local M = {}

local api = vim.api
local buf, win

function isFile(name)
  if type(name) ~= "string" then return false end
  if not isDir(name) then
    return os.rename(name, name) and true or false
    -- note that the short evaluation is to
    -- return false instead of a possible nil
  end
  return false
end

M.my_first_function = function(config)
  buf = api.nvim_create_buf(false, true) -- create new emtpy buffer

  local filenames_output = api.nvim_call_function("system", { "ls -1 " .. config.path })
  local filenames = vim.split(filenames_output, "\n")

  for i, m in ipairs(filenames) do
    local delPath = config.path .. m
    if isFile then
      print(string.format("%d[%s] delete", i, m))
      os.remove(delPath)
    end
  end

  print("SwpClear-end")
  return
end

return M
