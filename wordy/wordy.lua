local token_op = {
    ["+"] = function(a, b) return a + b end,
    ["-"] = function(a, b) return a - b end,
    ["*"] = function(a, b) return a * b end,
    ["/"] = function(a, b) return a / b end
}

local function tokenize(question)
    local clean_question = question:match("What is (.+)%?")
    assert(clean_question, "Invalid question")

    clean_question = clean_question:gsub("multiplied by", "*")
    clean_question = clean_question:gsub("divided by", "/")
    clean_question = clean_question:gsub("plus", "+")
    clean_question = clean_question:gsub("minus", "-")

    local tokens = {}
    for token in clean_question:gmatch("%S+") do
        table.insert(tokens, token)
    end

    return tokens
end

local function validate_tokens(tokens)
    assert(tokens[1] or tonumber(tokens[1]), "Invalid question")


    for i = 2, #tokens, 2 do
        assert(tokens[i] or token_op[tokens[i]], "Invalid question")
        assert(tokens[i + 1] or tonumber(tokens[i + 1]), "Invalid question")
    end

    return true
end

local function calculate(tokens)
    local result = tonumber(tokens[1])
    local err

    for i = 2, #tokens, 2 do
        local operator = tokens[i]
        local num2 = tonumber(tokens[i + 1])

        local operation = token_op[operator]
        assert(operation, "Invalid question")
        assert(not (operator == "/" and num2 == 0), "Division by zero")

        result = operation(result, num2)
    end

    return result
end

local function answer(question)
    local tokens = tokenize(question)
    local result

    if validate_tokens(tokens) then
        result = calculate(tokens)
    end

    return result
end

return { answer = answer }
