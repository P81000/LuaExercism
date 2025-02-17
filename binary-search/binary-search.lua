return function(array, target)
    if #array == 0 or (target < array[1] or target > array[#array]) then return -1 end
    if target == array[1] then return 1 end
    if target == array[#array] then return #array end

    local left = 2
    local right = #array

    while left < right do
        local middle = (left + right) // 2
        if target == array[middle] then return middle end

        if target > array[middle] then
            left = middle + 1
        else
            right = middle - 1
        end
    end

    return left
end
