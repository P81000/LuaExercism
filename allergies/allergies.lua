local allergens = {
    { "eggs",         1   },
    { "peanuts",      2   },
    { "shellfish",    4   },
    { "strawberries", 8   },
    { "tomatoes",     16  },
    { "chocolate",    32  },
    { "pollen",       64  },
    { "cats",         128 },
}

local function list(score)
    local result = {}
    for _, allergen in ipairs(allergens) do
        local name, value = allergen[1], allergen[2]
        if (score & value) ~= 0 then table.insert(result, name) end
    end

    return result
end

local function allergic_to(score, which)
    for _, allergen in ipairs(allergens) do
        local name, value = allergen[1], allergen[2]
        if name == which then return (score & value) ~= 0 end
    end

    return false
end

return { list = list, allergic_to = allergic_to }
