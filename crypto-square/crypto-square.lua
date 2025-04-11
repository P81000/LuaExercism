return {
  ciphertext = function(plaintext)
      local normalized = plaintext:lower():gsub("[%s%p]", "")
      local len = #normalized

      if len == 0 then return "" end

      local c = math.ceil(math.sqrt(len))
      local r = math.ceil(len / c)

      if c < r then c, r = r, c end

      local rect = {}
      for i = 1, r do
          rect[i] = normalized:sub((i - 1)*c + 1, i*c)
          rect[i] = rect[i] ..string.rep(" ", c - #rect[i])
      end

      local encoded = ""
      for col = 1, c do
          for row = 1, r do
              encoded = encoded .. (rect[row]:sub(col, col) or " ")
          end
      end

      local output = ""
      for i = 1, c do
          output = output .. encoded:sub((i - 1)*r + 1, i*r)
          if i < c then output = output .. " " end
      end

      return output
  end
}
