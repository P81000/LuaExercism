return function(s)
    local result = ""
    s = s:gsub("-", " ")

    s = s:gsub("[^%w%s]", "")

    for word in s:gmatch("%S+") do
        if word:match("^%u+$") then
            result = result .. word:sub(1, 1)
        else
            local caps = word:gsub("[^A-Z]", "")
            result = result .. (caps ~= "" and caps or word:sub(1,1):upper())
        end
    end

    return result
end

