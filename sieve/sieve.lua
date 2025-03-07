
return function(n)
    return coroutine.create(function()
        local isPrime = {}
        for i = 2, n do
            isPrime[i] = true
        end

        for i = 2, math.floor(math.sqrt(n)) do
            if isPrime[i] then
                for j = i * i, n, i do
                    isPrime[j] = false
                end
            end
        end

        for i = 2, n do
            if isPrime[i] then
                coroutine.yield(i)
            end
        end
    end)
end
