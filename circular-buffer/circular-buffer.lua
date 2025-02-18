local CircularBuffer = {}
CircularBuffer.__index = CircularBuffer

function CircularBuffer:new(len)
    local obj = {
        len = len,
        list = {},
        next = 1,
        count = 0
    }

    for i = 1, len do
        obj.list[i] = nil
    end

    setmetatable(obj, self)
    return obj
end

function CircularBuffer:write(value)
    if value == nil then return end
    assert(self.count < self.len, "buffer is full")

    self.list[self.next] = value
    self.next = (self.next % self.len) + 1
    self.count = self.count + 1
end


function CircularBuffer:read()
    assert(self.count > 0, "buffer is empty")

    local older = (self.next - self.count - 1) % self.len + 1
    local value = self.list[older]

    self.list[older] = nil
    self.count = self.count - 1

    return value
end

function CircularBuffer:forceWrite(value)
    if self.count < self.len then
        self.write(self, value)
        return
    end

    self.read(self)
    self.write(self, value)
end

function CircularBuffer:clear()
    for i = 1, self.len do
        self.list[i] = nil
        self.count = 0
        self.next = 1
    end
end

return CircularBuffer
