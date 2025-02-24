return {
  valid = function(s)
      s = s:gsub("%s+", "")

      if #s < 2 then return false end
      if string.match(s, "%D") then return false end

      local sum = 0
      for i = #s, 1, -1 do
          local num = tonumber(s:sub(i, i))
          if i % 2 == 0 then
              num = num * 2
              if num > 9 then num = num - 9 end
          end
          sum = sum + num
      end

      return sum % 10 == 0
  end
}
