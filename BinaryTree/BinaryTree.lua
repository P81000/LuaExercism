local BinaryTree = {}

function BinaryTree:new(value)
    local instance = {
        value = value,
        left = nil,
        right = nil
    }
    return setmetatable(instance, { __index = BinaryTree })
end

function BinaryTree:insert(new_value)
    if new_value < self.value then
        if self.left then
            self.left:insert(new_value)
        else
            self.left = BinaryTree:new(new_value)
        end
    else
        if self.right then
            self.right:insert(new_value)
        else
            self.right = BinaryTree:new(new_value)
        end
    end
end

function BinaryTree:find(value)
    if self.value == value then
        return true
    elseif value < self.value and self.left then
        return self.left:find(value)
    elseif value > self.value and self.right then
        return self.right:find(value)
    end
    return nil
end

function BinaryTree:show()
    if self.left then
        self.left:show()
    end
    io.write(self.value .. " ")
    if self.right then
        self.right:show()
    end
end

return BinaryTree
