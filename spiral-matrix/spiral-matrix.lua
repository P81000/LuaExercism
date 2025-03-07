return function(size)
    local mat = {}
    for i = 1, size do
        mat[i] = {}
    end

    local x, y = 1, 1
    local dx, dy = 1, 0

    for i = 1, size * size do
        mat[y][x] = i
        local next_x, next_y = x + dx, y + dy

        if next_x > size or next_y > size or next_x < 1 or next_y < 1 or mat[next_y][next_x] then
            dx, dy = -dy, dx
        end

        x, y = x + dx, y + dy
    end

    return mat
end

