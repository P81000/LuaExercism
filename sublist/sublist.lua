return function(sublist, list)
    if #sublist == 0 then return true end

    local liststr = "," .. table.concat(list, ",") .. ","
    local subliststr = "," .. table.concat(sublist, ",") .. ","

    return string.find(liststr, subliststr, 1, true) ~= nil
end
