local function tick(matrix)
    if #matrix == 0 then return {} end

    local rows, cols = #matrix, #matrix[1]
    local newState = {}

    -- Define os 8 vizinhos (vizinhança de Moore)
    local neighbors = {
        {-1, -1}, {-1, 0}, {-1, 1},
        {0, -1},           {0, 1},
        {1, -1},  {1, 0},  {1, 1}
    }

    for i = 1, rows do
        newState[i] = {}
        for j = 1, cols do
            local liveNeighbors = 0
            for _, d in ipairs(neighbors) do
                local ni, nj = i + d[1], j + d[2]
                if ni >= 1 and ni <= rows and nj >= 1 and nj <= cols and matrix[ni][nj] == 1 then
                    liveNeighbors = liveNeighbors + 1
                end
            end

            -- Regras do Jogo da Vida:
            -- Célula viva: sobrevive com 2 ou 3 vizinhos vivos, caso contrário morre.
            -- Célula morta: nasce se tiver exatamente 3 vizinhos vivos.
            if matrix[i][j] == 1 then
                if liveNeighbors < 2 or liveNeighbors > 3 then
                    newState[i][j] = 0
                else
                    newState[i][j] = 1
                end
            else
                if liveNeighbors == 3 then
                    newState[i][j] = 1
                else
                    newState[i][j] = 0
                end
            end
        end
    end

    return newState
end

return { tick = tick }

