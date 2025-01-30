return function(s)
    local seen = {}

    s = s:lower()

    for char in s:gmatch("%a") do
        if seen[char] then
            return false
        end
        seen[char] = true
    end

    return true
end
