local class = {
    [-1] = "deficient",
    [0] = "perfect",
    [1] = "abundant"
}

local function aliquot_sum(n)
    if n <= 1 then return 0 end

    local sum = 0

    for i = 1, n - 1 do
        if n % i == 0 then
            sum = sum + i
        end
    end

    return sum
end

local function classify(n)
    return class[(n > aliquot_sum(n) and -1) or (n < aliquot_sum(n) and 1) or 0]
end

return { aliquot_sum = aliquot_sum, classify = classify }
