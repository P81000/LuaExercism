local PhoneNumber = {}
PhoneNumber.__index = PhoneNumber

local function treatNum(num)
    local cleaned = num:gsub("%D", "")

    if #cleaned == 10 then
        return cleaned
    end

    if #cleaned == 11 and cleaned:sub(1, 1) == "1" then
        return cleaned:sub(2)
    end

    return "0000000000"
end

function PhoneNumber:new(number)
    local o = {
        number = treatNum(number)
    }
    setmetatable(o, self)
    return o
end

function PhoneNumber:__tostring()
    return string.format("(%s) %s-%s",
        self.number:sub(1, 3),
        self.number:sub(4, 6),
        self.number:sub(7, 10)
    )
end

function PhoneNumber:areaCode()
    return self.number:sub(1, 3)
end

return PhoneNumber
