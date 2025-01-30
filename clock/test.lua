local clock = require("clock")

local clock1 = clock.at(1, 7)
local clock2 = clock.at(1, 7)
print(clock1:equals(clock2))
