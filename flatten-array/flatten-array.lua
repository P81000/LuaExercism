local function flatten(input)
    local result = {}

    local function process(item)
        if item == nil then
            return
        elseif type(item) ~= "table" then
            table.insert(result, item)
        else
            for _, subItem in ipairs(item) do
                process(subItem)
            end
        end
    end

    process(input)
    return result
end

return flatten
