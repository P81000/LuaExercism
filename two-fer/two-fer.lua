local TwoFer = {}

function TwoFer.two_fer(name)
    local name_greeting = name or "you"

    return "One for " .. name_greeting .. ", one for me."
end

return TwoFer
