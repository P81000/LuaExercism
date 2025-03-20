local function backtracking(start, current_end, left_pieces, pieces)
    if left_pieces == 0 then return start == current_end end

    for i = 1, #pieces do
        local piece, a, b = pieces[i], pieces[i][1], pieces[i][2]

        if a == current_end then
            table.remove(pieces, i)
            if backtracking(start, b, left_pieces - 1, pieces) then return true end
            table.insert(pieces, i, piece)
        end

        if b == current_end then
            table.remove(pieces, i)
            if backtracking(start, a, left_pieces - 1, pieces) then return true end
            table.insert(pieces, i, piece)
        end
    end

    return false
end

local function can_chain(dominoes)
    if #dominoes == 0 then return true end

    for i = 1, #dominoes do
        local piece = dominoes[i]

        table.remove(dominoes, i)
        if backtracking(piece[1], piece[2], #dominoes, dominoes) then return true end

        if backtracking(piece[2], piece[1], #dominoes, dominoes) then return true end
        table.insert(dominoes, i, piece)
    end

    return false
end

return { can_chain = can_chain }

