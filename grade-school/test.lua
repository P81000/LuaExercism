local School = require('grade-school')

local school = School:new()

school:add("pedro", 2)
school:add("marcus", 2)

for grade, students in pairs(school:roster()) do
    io.write(grade, " ")
    for _, student in ipairs(students) do
        io.write(student, " ")
    end
    print()
end
