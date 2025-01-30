local BottleSong = {}

local quant = {
    "No",
    "One",
    "Two",
    "Three",
    "Four",
    "Five",
    "Six",
    "Seven",
    "Eight",
    "Nine",
    "Ten"
}

local function getBottles(n)
    return string.format("bottle%s", n == 1 and "" or "s")
end

local function verse(n)
    local a = string.format("%s green %s hanging on the wall,\n", quant[n + 1], getBottles(n))
    local b = "And if one green bottle should accidentally fall,\n"
    local c = string.format("There'll be %s green %s hanging on the wall.\n", quant[n]:lower(), getBottles(n - 1))
    return a .. a .. b .. c
end

function BottleSong.recite(start_bottles, take_down)
    local verses = {}
    for n = start_bottles, start_bottles - take_down + 1, -1 do
        table.insert(verses, verse(n))
    end

    return table.concat(verses, "\n")
end

return BottleSong
