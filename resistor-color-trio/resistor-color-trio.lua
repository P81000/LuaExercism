return {
  decode = function(c1, c2, c3)
      local color_map = {
          black = 0,
          brown = 1,
          red = 2,
          orange = 3,
          yellow = 4,
          green = 5,
          blue = 6,
          violet = 7,
          grey = 8,
          white = 9,
      }

      local v1, v2, v3 = color_map[c1], color_map[c2], color_map[c3]

      local total = (v1 * 10 + v2) * (10 ^ v3)

      local unit = "ohms"
      local divisor = 1

      if total >= 1e9 then
          divisor = 1e9
          unit = "gigaohms"
      elseif total >= 1e6 then
          divisor = 1e6
          unit = "megaohms"
      elseif total >= 1e3 then
          divisor = 1e3
          unit = "kiloohms"
      end

      local value = total / divisor

      return math.floor(value), unit

  end
}
