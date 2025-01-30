local SquareRoot = {}

function SquareRoot.square_root(radicand)
    local left, middle = 0, 0
    local right = (radicand // 2) + 1

    if radicand == 1 then
        return 1
    end

    while left ~= right - 1 do
        middle = (left + right) // 2

        if (middle * middle <= radicand) then
            left = middle
        else
            right = middle
        end
    end

    return left
end

return SquareRoot
