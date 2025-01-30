return function(s)
    local letters = ""

    s = s:lower()

    for letter in s:gmatch("%a") do
        if not letters:find(letter) then
            letters = letters .. letter
        end
    end

    return #letters == 26
end
