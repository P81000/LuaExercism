return function(n)
    local sequence = {
        "wink",
        "double blink",
        "close your eyes",
        "jump",
    }

    local result = {}

    for i = 1, 4 do
        if n & 1 == 1 then table.insert(result, sequence[i]) end
        n = n >> 1
    end

    if n & 1 == 1 then
        for i = 1, #result // 2 do
            result[i], result[#result - i + 1] = result[#result - i + 1], result[i]
        end
    end

    return result
end
