return function(input)
    local factor = {}
    local div = 2

    while input > 1 do
        if input % div == 0 then
            table.insert(factor, div)
            input = input / div
        else
            div = div + 1
        end
    end

    return factor
end
