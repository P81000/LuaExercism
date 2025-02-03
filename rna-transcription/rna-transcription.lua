return function(dna)
    local transcribe = {
        G = "C",
        C = "G",
        T = "A",
        A = "U"
    }

    local rna = ""

    for i = 1, #dna do
        rna = rna .. transcribe[dna:sub(i, i)]
    end

    return rna

end
