-- module represents a lua module for the plugin
local M = {}

print("require")
local api = vim.api

function exists(name)
  if type(name) ~= "string" then
    return false
  end
  return os.rename(name, name) and true or false
end

function isFile(name)
  if type(name) ~= "string" then
    return false
  end
  if not exists(name) then
    return false
  end
  local f = io.open(name)
  if f then
    f:close()
    return true
  end
  return false
end

function isDir(name)
  return (exists(name) and not isFile(name))
end

M.my_first_function = function(config)
  local filenames_output = api.nvim_call_function("system", { "ls -1 " .. config.path })
  local filenames = vim.split(filenames_output, "\n")

  for i, m in ipairs(filenames) do
    print(m)
    local delPath = config.path .. m
    if isFile(delPath) then
      print(string.format("%d[%s] delete", i, m))
      os.remove(delPath)
    end
  end

  print("SwpClear-end")
end

return M
