return {
  rotate = function(input, key)
      local output = ""
      for i = 1, #input do
          local c = input:sub(i, i)
          if c:match("%a") then
              local base = c:upper() == c and 65 or 97
              local shifted = (c:byte() - base + key) % 26
              output = output .. string.char(base + shifted)
          else
              output = output .. c
          end
      end

      return output
  end
}
