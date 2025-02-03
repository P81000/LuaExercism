return function(pos)
    assert(pos.row >= 0 and pos.row <= 7, "Invalid row")
    assert(pos.column > 0 and pos.column < 7, "Invalid column")

    local obj = {
        row = pos.row,
        column = pos.column
    }

    obj.can_attack = function(q2)
        if obj.row == q2.row or obj.column == q2.column or math.abs(pos.row - q2.row) == math.abs(pos.column - q2.column) then
            return true
        end
        return false
    end

    return obj
end
