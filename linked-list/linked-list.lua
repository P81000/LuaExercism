return function()
    local LinkedList = {
        head = nil,
        tail = nil,
        length = 0
    }

    function LinkedList:push(value)
        local node = {
            value = value,
            prev = nil,
            next = nil
        }

        if not self.head then
            self.head, self.tail = node, node
        else
            node.prev = self.tail
            self.tail.next = node
            self.tail = node
        end

        self.length = self.length + 1
    end

    function LinkedList:pop()
        if not self.tail then return nil end

        local value = self.tail.value
        self.tail = self.tail.prev

        if self.tail then
            self.tail.next = nil
        else
            self.head = nil
        end

        self.length = self.length - 1
        return value
    end

    function LinkedList:shift()
        if not self.head then return nil end

        local value = self.head.value
        self.head = self.head.next

        if self.head then
            self.head.prev = nil
        else
            self.tail = nil
        end
        self.length = self.length - 1
        return value
    end

    function LinkedList:unshift(value)
        local node = {
            value = value,
            prev = nil,
            next = nil
        }

        if not self.head then
            self.head, self.tail = node, node
        else
            node.next = self.head
            self.head.prev = node
            self.head = node
        end

        self.length = self.length + 1
    end

    function LinkedList:delete(value)
        local node = self.head

        while node do
            local next = node.next

            if node.value == value then
                if node.prev then
                    node.prev.next = node.next
                else
                    self.head = node.next
                end

                if node.next then
                    node.next.prev = node.prev
                else
                    self.tail = node.prev
                end

                node.prev = nil
                node.next = nil
                self.length = self.length - 1
            end

            node = next
        end
    end

    function LinkedList:count()
        return self.length
    end

    return LinkedList
end
