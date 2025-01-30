return function(numbers)
    return {
        to = function(limit)
            local sum = 0
            for i = 1, limit - 1 do
                for _, num in ipairs(numbers) do
                    if i % num == 0 then
                        sum = sum + i
                        break
                    end
                end
            end
            return sum
        end
    }
end
