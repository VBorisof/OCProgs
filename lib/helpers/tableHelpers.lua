local tableHelpers = {}


-- Flattens the table onto a new table, 
-- using a given function as an inner selector.
tableHelpers.flatMap = function(t, func) 
  local new_table = {}
  for key, value in pairs(t) do
    for i, innerValue in ipairs(key) do
      table.insert(new_table, func(key, value))
    end
  end
  return new_table
end

-- Maps a table onto a new table, 
-- using a given function as a selector.
tableHelpers.map = function(t, func)
  local new_table = {}
  for key, value in pairs(t) do
    table.insert(new_table, func(key, value))
  end
  return new_table
end

-- Returns the number of all elements in the given table
tableHelpers.count = function(t)
  local c = 0
  for _, _ in ipairs(t) do
    c = c+1
  end
  return c
end  

-- Returns table of elements of given table such that given predicate
-- function returns true for every such element.
tableHelpers.filter = function(t, func)
  local new_table = {}
  for key, value in pairs(t) do
    if func(key, value) then table.insert(new_table, value) end
  end  
  return new_table
end 

-- Performs a specified function on each element of given table
tableHelpers.foreach = function(t, func)
  for key, value in pairs(t) do
    func(key, value)
  end  
end 


return tableHelpers