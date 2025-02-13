local triangle = {}

function triangle.kind(a, b, c)
    assert(a + b > c and a + c > b and b + c > a, "Input Error")

    if a == b and b == c then return "equilateral"
    elseif a == b or a == c or b == c then return "isosceles"
    else return "scalene" end
end

return triangle
