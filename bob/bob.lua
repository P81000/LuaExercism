local bob = {}

function bob.hey(say)
    local answers = {
        question = "Sure",
        yell = "Whoa, chill out!",
        yell_question = "Calm down, I know what I'm doing!",
        silence = "Fine, be that way.",
        default = "Whatever"
    }

    say = say:match("^%s*(.-)%s*$") or ""

    if say == "" then
        return answers["silence"]
    elseif say:upper() == say and say:lower() ~= say and say:sub(-1) == "?" then
        return answers["yell_question"]
    elseif say:upper() == say and say:lower() ~= say then
        return answers["yell"]
    elseif say:sub(-1) == "?" then
        return answers["question"]
    else
        return answers["default"]
    end

end

return bob
