return function(n)
    assert(n > 0, "invalid num")
    if n == 1 then return 2 end

    local primes = {2}
    local candidate = 3

    while #primes < n do
        local isPrime = true
        local limit = math.sqrt(candidate)

        for i = 1, #primes do
            local p = primes[i]
            if p > limit then break end
            if candidate % p == 0 then
                isPrime = false
                break
            end
        end

        if isPrime then
            table.insert(primes, candidate)
        end

        candidate = candidate + 2
    end

    return primes[n]
end
