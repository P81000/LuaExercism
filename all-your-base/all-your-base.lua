local all_your_base = {}

all_your_base.convert = function(from_digits, from_base)
    assert(from_base > 1, "invalid input base")
    local decimal = 0
    for _, digit in ipairs(from_digits) do
        assert(digit >= 0, "negative digits are not allowed")
        assert(digit < from_base, "digit out of range")
        decimal = decimal * from_base + digit
    end

    local to = function(base)
        assert(base > 1, "invalid output base")
        local result = {}
        repeat
            table.insert(result, 1, decimal % base)
            decimal = decimal // base
        until decimal == 0
        return result
    end

    return { to = to }
end


return all_your_base
