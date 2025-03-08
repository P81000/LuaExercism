local function keep(xs, pred)
    local res = {}
    for _, element in ipairs(xs) do
        if pred(element) then
            table.insert(res, element)
        end
    end
    return res
end

local function discard(xs, pred)
    local res = {}
    for _, element in ipairs(xs) do
        if not pred(element) then
            table.insert(res, element)
        end
    end
    return res
end

return { keep = keep, discard = discard }
