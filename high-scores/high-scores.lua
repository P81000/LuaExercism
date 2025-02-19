local HighScores = {}

function HighScores:scores()
    return self.points
end

function HighScores:latest()
    return self.points[#self.points]
end

function HighScores:personal_best()
    return self.sorted[#self.sorted]
end

function HighScores:personal_top_three()
    return { self.sorted[#self.sorted], self.sorted[#self.sorted - 1], self.sorted[#self.sorted - 2] }
end

return function(scores)
  local high_scores = {
      points = scores,
      sorted = { table.unpack(scores) }
  }

  table.sort(high_scores.sorted)

  setmetatable(high_scores, { __index = HighScores })

  return high_scores
end
