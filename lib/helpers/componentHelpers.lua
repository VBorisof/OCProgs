local componentHelpers = {}


local tableHelpers = require "helpers/tableHelpers"
local io = require "io"
local component = require "component"

-- Generates and returns a table of all proxies for given component type
componentHelpers.proxyComponents = function(type)
  return tableHelpers.map(component.list(type), 
    function(key, value) return component.proxy(key) end)
end

-- Set throwFlag to throw if label not found - true by default
-- If not set, returns -1 in case label doesn't exist
componentHelpers.getComponentAddressLabelAsNumber = function(address, throwFlag)
  local handle = io.popen("label -a "..address)
  local result = -1
  if not throwFlag then
    local text = handle:read()
    if text then result = tonumber(handle:read()) end
  else
    result = assert(tonumber(handle:read()), "No label for component "..address.." found")
  end
  handle:close()
  return result
end


return componentHelpers 