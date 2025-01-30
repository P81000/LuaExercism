return {
  value = function(colors)
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

      local v1, v2 = color_map[colors[1]], color_map[colors[2]]

      return (v1 * 10 + v2)
  end
}
