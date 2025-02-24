local function reduce(xs, value, f)
    local acc = value
    for _, v in ipairs(xs) do
        acc = f(v, acc)
    end
    return acc
end

local function map(xs, f)
    local result = {}
    for _, value in ipairs(xs) do
        table.insert(result, f(value))
    end
    return result
end

local function filter(xs, pred)
    local result = {}
    for _, value in ipairs(xs) do
        if pred(value) then
            table.insert(result, value)
        end
    end
    return result
end

return { map = map, reduce = reduce, filter = filter }
