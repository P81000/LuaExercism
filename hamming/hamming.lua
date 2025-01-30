local Hamming = {}

function Hamming.compute(a, b)
    if #a ~= #b then
        return -1
    end

    local counter = 0
    for i = 1, #a do
        if a:sub(i, i) ~= b:sub(i, i) then
            counter = counter + 1
        end
    end

    return counter
end

return Hamming

