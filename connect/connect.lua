local function parse(board)
    local grid = {}
    for i, line in ipairs(board) do
        local row = {}
        for cell in line:gmatch("%S+") do row[#row + 1] = cell end
        grid[i] = row
    end
    return grid
end

local function initialize(grid)
    local visited = {}
    for i = 1, #grid do
        visited[i] = {}
        for j = 1, #grid[1] do visited[i][j] = false end
    end
    return visited
end

local neighbors = { {-1, 0}, {-1, 1}, {0, -1}, {0, 1}, {1, -1}, {1, 0} }

local function dfs(grid, i, j, player, visited)
    local rows, cols = #grid, #grid[1]
    if player == "X" and j == cols or player == "O" and i == rows then return true end
    visited[i][j] = true
    for _, d in ipairs(neighbors) do
        local ni, nj = i + d[1], j + d[2]
        if ni >= 1 and ni <= rows and nj >= 1 and nj <= cols and not visited[ni][nj] and grid[ni][nj] == player then
            if dfs(grid, ni, nj, player, visited) then return true end
        end
    end
    return false
end

return {
    winner = function(board)
        if #board == 0 then return "" end
        local grid = parse(board)
        local rows, cols = #grid, #grid[1]

        -- Test player X
        local visited = initialize(grid)
        for i = 1, rows do
            if grid[i][1] == "X" and not visited[i][1] then
                if dfs(grid, i, 1, "X", visited) then return "X" end
            end
        end

        -- Test player O
        visited = initialize(grid)
        for j = 1, cols do
            if grid[1][j] == "O" and not visited[1][j] then
                if dfs(grid, 1, j, "O", visited) then return "O" end
            end
        end

        return ""
    end
}
