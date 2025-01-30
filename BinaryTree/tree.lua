local BinaryTree = require("BinaryTree")

local tree = BinaryTree:new(5)

for i = 1, 10 do
    tree:insert(i)
end

print(tree:find(3))
tree:show()
print()
