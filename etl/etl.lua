return {
  transform = function(dataset)
      local new = {}
      for score, letters in pairs(dataset) do
          for _, letter in ipairs(letters) do
              new[letter:lower()] = score
          end
      end

      return new
  end
}
