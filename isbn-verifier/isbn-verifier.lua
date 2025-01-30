return {
  valid = function(isbn)
      isbn = isbn:gsub("-", "")

      local pattern = "^%d%d%d%d%d%d%d%d%d[%dX]$"
      if not isbn:match(pattern) then return false end

      if #isbn ~= 10 then return false end

      local digit = (isbn:sub(10, 10) == "X") and 10 or tonumber(isbn:sub(10, 10))
      local sum = 0
      for i = 1, 9 do
          sum = sum + tonumber(isbn:sub(i, i)) * i
      end

      sum = sum + digit * 10

      return sum % 11 == 0
  end
}
