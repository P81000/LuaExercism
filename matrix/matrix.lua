return function(s)
    local matrix_rows = {}
    local matrix_columns = {}

    for line in s:gmatch("[^\n]+") do
        local row = {}
        local col_indx = 1

        for num in line:gmatch("%S+") do
            table.insert(row, tonumber(num))

            if not matrix_columns[col_indx] then
                matrix_columns[col_indx] = {}
            end
            table.insert(matrix_columns[col_indx], tonumber(num))

            col_indx = col_indx + 1
        end

        table.insert(matrix_rows, row)
    end

    local function row(pos)
        return matrix_rows[pos]
    end

    local function column(pos)
        return matrix_columns[pos]
    end

    return { row = row, column = column }
end
