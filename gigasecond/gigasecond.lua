local gigasecond = {}

function gigasecond.anniversary(any_date)
    local new_date = any_date + 1e9
    return os.date("%x", new_date)
end

return gigasecond
