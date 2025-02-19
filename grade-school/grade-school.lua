local School = {}

function School:new()
    local obj = {
        grades = setmetatable({}, { __index = function(t, k)
            t[k] = {}
            return t[k]
        end })
    }

    return setmetatable(obj, { __index = School })
end

function School:add(name, grade)
    table.insert(self.grades[grade], name:sub(1, 1):upper() .. name:sub(2):lower())
    table.sort(self.grades[grade])
end

function School:grade(grade)
    return self.grades[grade]
end

function School:roster()
    return self.grades
end

return School
