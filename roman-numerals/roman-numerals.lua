return {
  to_roman = function(n)
      local roman = {
          { 1000,   "M"     },
          { 900,    "CM"    },
          { 500,    "D"     },
          { 400,    "CD"    },
          { 100,    "C"     },
          { 90,     "XC"    },
          { 50,     "L"     },
          { 40,     "XL"    },
          { 10,     "X"     },
          { 9,      "IX"    },
          { 5,      "V"     },
          { 4,      "IV"    },
          { 1,      "I"     }
      }
      local result = ""

      for _, pair in ipairs(roman) do
          local value, symbol = pair[1], pair[2]
          while n >= value do
              result = result .. symbol
              n = n - value
          end
      end

      return result
  end
}
