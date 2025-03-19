return function(n)
    return coroutine.create(function()
        if n < 2 then return end
        local isPrime = {}
        isPrime[2] = true
        for i = 3, n, 2 do
            isPrime[i] = true
        end

        coroutine.yield(2)

        for i = 3, math.floor(math.sqrt(n)), 2 do
            if isPrime[i] then
                for j = i * i, n, i * 2 do
                    isPrime[j] = false
                end
            end
        end

        for i = 3, n, 2 do
            if isPrime[i] then
                coroutine.yield(i)
            end
        end
    end)
end
