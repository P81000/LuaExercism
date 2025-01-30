local BankAccount = {}

function BankAccount:new()
    local instance = {
        amount = 0,
        isClosed = false
    }
    setmetatable(instance, { __index = self })
    return instance
end

function BankAccount:balance()
    if self.isClosed then
        error("Account Closed")
    end
    return self.amount
end

function BankAccount:deposit(value)
    if value <= 0 or self.isClosed then
        error("Invalid deposit")
    end
    self.amount = self.amount + value
end

function BankAccount:withdraw(value)
    if value <= 0 or value > self.amount or self.isClosed then
        error("Invalid withdraw")
    end
    self.amount = self.amount - value
end

function BankAccount:close()
    self.isClosed = true
end

return BankAccount
