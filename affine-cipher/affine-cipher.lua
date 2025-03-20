local function is_coprime(a, b)
    while b ~= 0 do
        a, b = b, a % b
    end
    return a == 1
end

local function mmi(a, b)
    local m0, x0, x1 = b, 0, 1

    while a > 1 do
        local q = a // b
        b, a = a % b, b
        x0, x1 = x1 - q * x0, x0
    end

    if x1 < 0 then x1 = x1 + m0 end
    return x1
end

local function encode(phrase, key)
    assert(is_coprime(key.a, 26), "a and m must be coprime.")
    phrase = phrase:lower():gsub("[^%w]", "")

    local encoded = ""
    for j = 1, #phrase do
        local char = phrase:sub(j, j)
        if not char:match("%d") then
            local i = char:byte() - 97

            char = (key.a * i + key.b) % 26
            char = string.char(char + 97)
        end
        encoded = encoded .. char

        if j % 5 == 0 then encoded = encoded .. " " end
    end
    return encoded:gsub("%s*$", "")
end

local function decode(phrase, key)
    assert(is_coprime(key.a, 26), "a and m must be coprime.")
    phrase = phrase:lower():gsub("[^%w]", "")

    local decoded = ""
    local a_inv = mmi(key.a, 26)
    for j = 1, #phrase do
        local char = phrase:sub(j, j)
        if not char:match("%d") then
            local y = char:byte() - 97

            char = (a_inv * (y - key.b)) % 26
            char = string.char(char + 97)
        end

        decoded = decoded .. char
    end

    return decoded
end

return { encode = encode, decode = decode }
