local function tick(matrix)
    if #matrix == 0 then return {} end
    local rows, cols = #matrix, #matrix[1]
    local total_cells = rows * cols

    local neighbors = { {-1, -1}, {-1, 0}, {-1, 1}, {0, -1}, {0, 1}, {1, -1}, {1, 0}, {1, 1} }

    local new_matrix = {}
    for i = 1, rows do new_matrix[i] = {} end

    for idx = 1, total_cells do
        local i = math.floor((idx - 1) / cols) + 1
        local j = ((idx - 1) % cols) + 1
        local count = 0
        for _, d in ipairs(neighbors) do
            local ni, nj = i + d[1], j + d[2]
            if ni >= 1 and ni <= rows and nj >= 1 and nj <= cols and matrix[ni][nj] == 1 then count = count + 1 end
        end

        new_matrix[i][j] = (matrix[i][j] == 1) and ((count >= 2 and count <= 3) and 1 or 0) or ((count == 3) and 1 or 0)
    end
    return new_matrix
end

return { tick = tick }
