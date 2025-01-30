local Darts = {}

local function isInside(x, y, radius)
    local dist = x^2 + y^2
    return dist <= radius^ 2
end

function Darts.score(x, y)
    local inner_radius, middle_radius, outer_radius = 1, 5, 10

    if isInside(x, y, inner_radius) then
        return 10
    elseif isInside(x, y, middle_radius) then
        return 5
    elseif isInside(x, y, outer_radius) then
        return 1
    else
        return 0
    end
end

return Darts
