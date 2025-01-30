local Proverb = {}

function Proverb.recite(strings)

    if #strings == 0 then return "" end

    local parts = {}
    for i = 1, #strings - 1 do
        table.insert(parts, string.format("For want of a %s the %s was lost.\n", strings[i], strings[i+1]))
    end

    table.insert(parts, string.format("And all for the want of a %s.\n", strings[1]))
    return table.concat(parts)
end

return Proverb
