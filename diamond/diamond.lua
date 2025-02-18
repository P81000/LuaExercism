return function(which)
    local letter = string.upper(which)
    local size = string.byte(letter) - string.byte("A") + 1
    local dshape = {}

    for i = 0, size - 1 do
        local char = string.char(string.byte("A") + i)
        local padding = size - i - 1
        local line

        if i == 0 then
            line = string.rep(" ", padding) .. char .. string.rep(" ", padding)
        else
            local spaces_between = 2 * i - 1
            line = string.rep(" ", padding) .. char .. string.rep(" ", spaces_between) .. char .. string.rep(" ", padding)
        end

        table.insert(dshape, line)
    end

    for i = size - 2, 0, -1 do
        table.insert(dshape, dshape[i + 1])
    end

    return table.concat(dshape, "\n") .. "\n"
end
