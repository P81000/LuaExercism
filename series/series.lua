return function(s, length)
    local i = 0
    local res = {}
    if length > #s then
        goto finish
    end
    if length == #s then
        table.insert(res, s)
        goto finish
    end

    for j = 1, #s - length + 1 do
        table.insert(res, s:sub(j, j + length - 1))
    end


    ::finish::
    return function ()
        i = i + 1
        if i <= #res then return res[i] end
    end
end
