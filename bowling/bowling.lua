return function()
    local rollNumber = 0
    local pinsRemaining = 10
    local frame = 1
    local extraRolls = 0
    local mult = 1
    local nextmult = 1
    local score = 0

    return {
        roll = function(pins)
            assert(pins >= 0 and pins <= pinsRemaining)
            assert(frame <= 10 or extraRolls > 0)

            extraRolls = extraRolls - 1
            rollNumber  = rollNumber + 1
            pinsRemaining = pinsRemaining - pins
            score = score + mult * pins
            mult = nextmult
            nextmult = frame < 10 and 1 or 0

            if rollNumber == 1 and pinsRemaining == 0 then
                if frame <= 10 and extraRolls < 2 then
                    extraRolls = 2
                end

                pinsRemaining = 10
                frame = frame + 1
                rollNumber = 0
                if frame <= 10 then
                    mult = mult + 1
                end
                nextmult = nextmult + 1
            elseif rollNumber == 2 then
                if pinsRemaining == 0 then
                    mult = mult + 1
                    if frame <= 10 then
                        if extraRolls < 1 then extraRolls = 1 end
                    end
                else
                end
                rollNumber = 0
                pinsRemaining = 10
                frame = frame + 1
            end
        end,
        score = function()
            assert(frame > 10 and extraRolls <= 0)
            return score
        end
    }
end
