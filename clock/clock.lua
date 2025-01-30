local Clock = {}
Clock.__index = Clock

function Clock:new(hour, minute)
    local instance = {
        minute = hour * 60 + (minute or 0)
    }
    setmetatable(instance, self)
    return instance
end

function Clock:__tostring()
    return string.format("%02d:%02d", (self.minute // 60) % 24, self.minute % 60)
end

function Clock.at(hour, minute)
    return Clock:new(hour, minute)
end

function Clock:minus(minutes)
    self.minute = self.minute - minutes
    return self
end

function Clock:plus(minutes)
    self.minute = self.minute + minutes
    return self
end

function Clock:equals(other)
    return self.minute % (24 * 60) == other.minute % (24 * 60)
end

return Clock
