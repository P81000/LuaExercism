local yacht = {}

local function sum(values)
    local total = 0
    for _, num in ipairs(values) do
        total = total + num
    end
    return total
end

yacht.score = function(dice, category)
    local seen = {}
    local index = {}
    local count = 0
    for _, num in ipairs(dice) do
        if not seen[num] then
            seen[num] = 0
            count = count + 1
            index[count] = num
        end
        seen[num] = seen[num] + 1
    end

    if category == "ones" then return (seen[1] or 0) end
    if category == "twos" then return (seen[2] or 0) * 2 end
    if category == "threes" then return (seen[3] or 0) * 3 end
    if category == "fours" then return (seen[4] or 0) * 4 end
    if category == "fives" then return (seen[5] or 0) * 5 end
    if category == "sixes" then return (seen[6] or 0) * 6 end
    if category == "yacht" then return (count == 1) and 50 or 0 end
    if category == "choice" then return sum(dice) end
    if category == "little straight" then return ((count == 5) and math.max(table.unpack(dice)) == 5 and math.min(table.unpack(dice)) == 1) and 30 or 0 end
    if category == "big straight" then return ((count == 5) and math.max(table.unpack(dice)) == 6 and math.min(table.unpack(dice)) == 2) and 30 or 0 end
    if category == "full house" then return (count == 2 and seen[index[1]] == 3 or seen[index[2]] == 3) and sum(dice) or 0 end
    if category == "four of a kind" then return (count == 2 and (seen[index[1]] == 4 and index[1] * 4) or (seen[index[2]] == 4) and index[2] * 4) or (count == 1 and index[1] * 4) or 0 end
end

return yacht
