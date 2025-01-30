local Character = {}

local function ability(scores)
    local min_value = scores[1]
    local sum = 0
    for _, score in ipairs(scores) do
        sum = sum + score
        if score < min_value then
            min_value = score
        end
    end

    return sum - min_value
end

local function roll_dice()
    local dice = {}
    for i = 1, 4 do
        dice[i] = math.random(1, 6)
    end

    return dice
end

local function modifier(input)
    return (input - 10) // 2
end

function Character:new(name)
    local instance = {
        name = name,
        strength = ability(roll_dice()),
        dexterity = ability(roll_dice()),
        constitution = ability(roll_dice()),
        intelligence = ability(roll_dice()),
        wisdom = ability(roll_dice()),
        charisma = ability(roll_dice()),
    }

    instance.hitpoints = 10 + modifier(instance.constitution)
    setmetatable(instance, { __index = self })
    return instance
end

return { Character = Character, ability = ability, roll_dice = roll_dice, modifier = modifier }
