local HighScores = require 'high-scores'

local values = { 30, 50, 20, 70 }
local scores = HighScores(values)
print(scores:scores())

for _, v in ipairs(scores:personal_top_three()) do
    print(v)
end
