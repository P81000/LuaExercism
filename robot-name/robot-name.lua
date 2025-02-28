local Robot = {}

local function newName()
    local name = ""
    for _ = 1, 2 do
        name = name .. string.char(math.random(65, 90))
    end

    for _ = 1, 3 do
        name = name .. tostring(math.random(0, 9))
    end
    return name

end
function Robot:new()
    local instance = { name = newName() }
    setmetatable(instance, { __index = self })
    return instance
end

function Robot:reset()
    self.name = newName()
end

return Robot
