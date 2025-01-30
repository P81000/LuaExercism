return {
  encode = function(plaintext)
      plaintext = plaintext:lower()
      local output = ""
      local counter = 0
      for i = 1, #plaintext do
          local char = plaintext:sub(i, i)
          if char:match("%a") then
              local shifted = 122 - (string.byte(char) - 97)
              output = output .. string.char(shifted)
              counter = counter + 1
              if counter % 5 == 0 then
                  output = output .. " "
              end
          elseif char:match("%d") then
              output = output .. char
              counter = counter + 1

              if counter % 5 == 0 then
                  output = output .. " "
              end
          end
      end

      if output:sub(-1) == " " then
          output = output:sub(1, -2)
      end

      return output
  end
}
