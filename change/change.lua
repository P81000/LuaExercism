return function(amount, values)
    local indexed_values = {}
    for i, v in ipairs(values) do
        table.insert(indexed_values, { value = v, index = i })
    end

    table.sort(indexed_values, function(a, b) return a.value > b.value end)

    local counts = {}
    for i = 1, #values do
        counts[i] = 0
    end

    for _, coin in ipairs(indexed_values) do
        if amount >= coin.value then
            counts[coin.index] = math.floor(amount / coin.value)
            amount = amount % coin.value
        end
    end

    return amount == 0 and counts or nil
end
