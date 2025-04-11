local Garden = {}
Garden.__index = Garden

return function(s)
    local students = { "alice", "bob", "charlie", "david", "eve", "fred", "ginny", "harriet", "ileana", "joseph", "kincaid", "larry" }


    local plant_codes = {
        g = "grass",
        c = "clover",
        r = "radishes",
        v = "violets"
    }

    local self = setmetatable({}, Garden)

    local rows = {}
    for line in s:gmatch("[^\n]+") do table.insert(rows, line) end

    self.upper_row, self.lower_row = rows[1], rows[2]

    for i, student in ipairs(students) do
        local start_pos = (i - 1) * 2 + 1
        local plants = {}

        if start_pos <= #self.upper_row then
            local code1 = self.upper_row:sub(start_pos, start_pos):lower()
            table.insert(plants, plant_codes[code1])

            if start_pos + 1 <= #self.upper_row then
                local code2 = self.upper_row:sub(start_pos + 1, start_pos + 1):lower()
                table.insert(plants, plant_codes[code2])
            end
        end

        if start_pos <= #self.lower_row then
            local code3 = self.lower_row:sub(start_pos, start_pos):lower()
            table.insert(plants, plant_codes[code3])

            if start_pos + 1 <= #self.lower_row then
                local code4 = self.lower_row:sub(start_pos + 1, start_pos + 1):lower()
                table.insert(plants, plant_codes[code4])
            end
        end

        self[student] = plants
    end

    return setmetatable(self, {
        __index = function(t, key)
            if type(key) == "string" then
                local lowercase_key = key:lower()
                return rawget(t, lowercase_key) or {}
            end
            return {}
        end
    })
end
