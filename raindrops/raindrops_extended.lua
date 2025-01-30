return  function(n)
    local rules = {
        {3, "Pling"},
        {5, "Plang"},
        {7, "Plong"}
    }
    local output = ""
    for _, rule in pairs(rules) do
        if n % rule[1] == 0 then
            output = output .. rule[2]
        end
    end
    return output == "" and tostring(n) or output
end
