local function to_decimal(input)
    local result = 0
    local mult = 1
    for i = #input, 1, -1 do
        local char = input:sub(i, i)
        if char ~= "0" and char ~= "1" then
            return 0
        end

        result = result + tonumber(char) * mult
        mult = mult * 2
    end

    return result

end

return { to_decimal = to_decimal }
