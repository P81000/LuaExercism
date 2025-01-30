local codons = {
    AUG = "Methionine",
    UUU = "Phenylalanine", UUC = "Phenylalanine",
    UUA = "Leucine", UUG = "Leucine",
    UCU = "Serine", UCC = "Serine", UCA = "Serine", UCG = "Serine",
    UAU = "Tyrosine", UAC = "Tyrosine",
    UGU = "Cysteine", UGC = "Cysteine",
    UGG = "Tryptophan",
    UAA = "STOP", UAG = "STOP", UGA = "STOP"
}

local function translate_codon(codon)
    return codons[codon] or error()
end

local function translate_rna_strand(rna_strand)
    local proteins = {}
    for i = 1, #rna_strand, 3 do
        local codon = rna_strand:sub(i, i+2)
        if not codons[codon] then error() end
        if codons[codon] == "STOP" then break end
        table.insert(proteins, codons[codon])
    end

    return proteins
end

return { codon = translate_codon, rna_strand = translate_rna_strand }
