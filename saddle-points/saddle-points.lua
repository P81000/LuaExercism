return function(matrix)
    if #matrix == 0 or #matrix[1] == 0 then
        return {}
    end

    local rows = #matrix
    local cols = #matrix[1]
    local result = {}

    local max_row = {}
    for i = 1, rows do
        max_row[i] = matrix[i][1]
        for j = 2, cols do
            if matrix[i][j] > max_row[i] then
                max_row[i] = matrix[i][j]
            end
        end
    end

    local min_col = {}
    for i = 1, cols do
        min_col[i] = matrix[1][i]
        for j = 2, rows do
            if matrix[j][i] < min_col[i] then
                min_col[i] = matrix[j][i]
            end
        end
    end

    for i = 1, rows do
        for j = 1, cols do
            if matrix[i][j] == max_row[i] and matrix[i][j] == min_col[j] then
                table.insert(result, { row = i, column = j })
            end
        end
    end

    return result
end
