local function round(num)
    return tonumber(string.format("%.2f", num))
end

local SpaceAge = {}

local EARTH_YEAR_SECONDS = 60 * 60 * 24 * 365.25

local planets = {
    earth = 1,
    mercury = 0.2408467,
    venus = 0.61519726,
    mars = 1.8808158,
    jupiter = 11.862615,
    saturn = 29.447498,
    uranus = 84.016846,
    neptune = 164.79132
}

function SpaceAge:new(age_in_seconds)
    Instance = {
        seconds = age_in_seconds
    }
    return setmetatable(Instance, { __index = self })
end

function SpaceAge.on_earth()
    return round(Instance.seconds / EARTH_YEAR_SECONDS)
end

for k, v in pairs(planets) do
    SpaceAge["on_" .. k] = function() return(round(Instance.seconds / v / EARTH_YEAR_SECONDS)) end
end

return SpaceAge
