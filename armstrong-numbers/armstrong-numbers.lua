local ArmstrongNumbers = {}

function ArmstrongNumbers.is_armstrong_number(number)
    local sum = 0
    local num_str = tostring(number)

    for num in num_str:gmatch("%d") do
        sum = sum + (tonumber(num) ^ #num_str)
    end

    return sum == number
end
return ArmstrongNumbers
