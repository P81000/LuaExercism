--- @diagnostic disable: undefined-global
local assert = require("luassert")
local etl = require('etl')

describe('etl', function()
  it('should correctly transform a dataset with a single mapping', function()
    local old = { [1] = { 'A' } }
    local expected = { a = 1 }
    assert.same(expected, etl.transform(old))
  end)

  it('should correctly transform a dataset with multiple mappings', function()
    local old = { [1] = { 'A' }, [2] = { 'D' } }
    local expected = { a = 1, d = 2 }
    assert.same(expected, etl.transform(old))
  end)

  it('should correctly transform a dataset with multiple letters for a score', function()
    local old = { [1] = { 'A', 'E' }, [2] = { 'D', 'G' } }
    local expected = { a = 1, e = 1, d = 2, g = 2 }
    assert.same(expected, etl.transform(old))
  end)

  it('should correctly transform a full dataset', function()
    local old = {
      [1] = { 'A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T' },
      [2] = { 'D', 'G' },
      [3] = { 'B', 'C', 'M', 'P' },
      [4] = { 'F', 'H', 'V', 'W', 'Y' },
      [5] = { 'K' },
      [8] = { 'J', 'X' },
      [10] = { 'Q', 'Z' }
    }
    local expected = {
      a = 1,
      b = 3,
      c = 3,
      d = 2,
      e = 1,
      f = 4,
      g = 2,
      h = 4,
      i = 1,
      j = 8,
      k = 5,
      l = 1,
      m = 3,
      n = 1,
      o = 1,
      p = 3,
      q = 10,
      r = 1,
      s = 1,
      t = 1,
      u = 1,
      v = 4,
      w = 4,
      x = 8,
      y = 4,
      z = 10
    }
    assert.same(expected, etl.transform(old))
  end)
end)
