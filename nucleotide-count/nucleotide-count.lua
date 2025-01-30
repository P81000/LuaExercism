local DNA = {}

function DNA:new(string)
    local counter = {
        A = 0,
        T = 0,
        C = 0,
        G = 0
    }

    for i = 1, #string do
        if not counter[string:sub(i, i)] then
            error("Invalid Sequence")
        end

        counter[string:sub(i, i)] = counter[string:sub(i, i)] + 1
    end

    local o = {
        nucleotideCounts = counter
    }
    setmetatable(o, { __index = self })
    return o
end

function DNA:count(nucleotide)
    if not self.nucleotideCounts[nucleotide] then
        return error("Invalid Nucleotide")
    end
    return self.nucleotideCounts[nucleotide]
end

return DNA
