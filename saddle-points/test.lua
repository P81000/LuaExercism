local test = require("saddle-points")

local m = {
    { 9, 8, 7, 8 },
    { 5, 3, 2, 4 },
    { 6, 6, 7, 1 }
}

local result = test(m)

for i, j in pairs(result) do
    for k, l in pairs(j) do
        print(k, l)
    end
end

