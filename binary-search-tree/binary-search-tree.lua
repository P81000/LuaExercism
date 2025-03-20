local BinarySearchTree = {}

function BinarySearchTree:new(value)
    local obj = {
        value = value,
        left = nil,
        right = nil
    }

    return setmetatable(obj, { __index = BinarySearchTree })
end

function BinarySearchTree:insert(new_value)
    if new_value <= self.value then
        if self.left then self.left:insert(new_value)
        else self.left = BinarySearchTree:new(new_value) end
    else
        if self.right then self.right:insert(new_value)
        else self.right = BinarySearchTree:new(new_value) end
    end
end

function BinarySearchTree:values()
    local stack = {}
    local curr = self

    local function push(node)
        while node do
            table.insert(stack, node)
            node = node.left
        end
    end

    push(curr)

    return function()
        curr = table.remove(stack)
        if not curr then return nil end
        push(curr.right)
        return curr.value
    end
end

function BinarySearchTree:from_list(new_values)
    assert(#new_values > 0, "empty list")
    local tree = self:new(new_values[1])
    for i = 2, #new_values do tree:insert(new_values[i]) end
    return tree
end

return BinarySearchTree
