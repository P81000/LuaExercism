--- @diagnostic disable: undefined-global
local assert = require("luassert")
local clock = require('clock')

describe('clock', function()
  describe('at', function()
    it('should create a clock on the hour', function()
      assert.are.equal('08:00', tostring(clock.at(8, 0)))
    end)

    it('should create a clock past the hour', function()
      assert.are.equal('11:09', tostring(clock.at(11, 9)))
    end)

    it('should treat midnight (24:00) as 00:00', function()
      assert.are.equal('00:00', tostring(clock.at(24, 00)))
    end)

    it('should roll over hours', function()
      assert.are.equal('01:00', tostring(clock.at(25, 00)))
    end)

    it('should continuously roll over hours', function()
      assert.are.equal('04:00', tostring(clock.at(100, 00)))
    end)

    it('should add sixty minutes to hours', function()
      assert.are.equal('02:00', tostring(clock.at(1, 60)))
    end)

    it('should roll over minutes to hours', function()
      assert.are.equal('02:00', tostring(clock.at(1, 60)))
    end)

    it('should continuously roll over minutes to hours', function()
      assert.are.equal('04:43', tostring(clock.at(0, 1723)))
    end)

    it('should roll over hours and minutes', function()
      assert.are.equal('03:40', tostring(clock.at(25, 160)))
    end)

    it('should continuously roll over hours and minutes', function()
      assert.are.equal('11:01', tostring(clock.at(201, 3001)))
    end)

    it('should roll over hours and minutes to exactly midnight', function()
      assert.are.equal('00:00', tostring(clock.at(72, 8640)))
    end)

    it('should convert negative hours', function()
      assert.are.equal('23:15', tostring(clock.at(-1, 15)))
    end)

    it('should roll over negative hours', function()
      assert.are.equal('23:00', tostring(clock.at(-25, 0)))
    end)

    it('should continuously roll over negative hours', function()
      assert.are.equal('05:00', tostring(clock.at(-91, 0)))
    end)

    it('should convert negative minutes', function()
      assert.are.equal('00:20', tostring(clock.at(1, -40)))
    end)

    it('should roll over negative minutes', function()
      assert.are.equal('22:20', tostring(clock.at(1, -160)))
    end)

    it('should continuously roll over negative minutes', function()
      assert.are.equal('16:40', tostring(clock.at(1, -4820)))
    end)

    it('should roll over negative hours and minutes', function()
      assert.are.equal('20:20', tostring(clock.at(-25, -160)))
    end)

    it('should continuously roll over negative hours and minutes', function()
      assert.are.equal('22:10', tostring(clock.at(-121, -5810)))
    end)

    it('should assume 0 minutes if none are provided', function()
      assert.are.equal('08:00', tostring(clock.at(8)))
    end)
  end)

  describe('add', function()
    it('should add minutes', function()
      local clock = clock.at(10, 0):plus(3)
      assert.are.equal('10:03', tostring(clock))
    end)

    it('should add no minutes', function()
      local clock = clock.at(6, 41):plus(0)
      assert.are.equal('06:41', tostring(clock))
    end)

    it('should add minutes to the next hour', function()
      local clock = clock.at(0, 45):plus(40)
      assert.are.equal('01:25', tostring(clock))
    end)

    it('should add more than an hour', function()
      local clock = clock.at(10, 00):plus(61)
      assert.are.equal('11:01', tostring(clock))
    end)

    it('should add more than two hours with carry', function()
      local clock = clock.at(0, 45):plus(160)
      assert.are.equal('03:25', tostring(clock))
    end)

    it('should add across midnight', function()
      local clock = clock.at(23, 59):plus(2)
      assert.are.equal('00:01', tostring(clock))
    end)

    it('should add more than one day', function()
      local clock = clock.at(5, 32):plus(1500)
      assert.are.equal('06:32', tostring(clock))
    end)

    it('should add more than two days', function()
      local clock = clock.at(1, 1):plus(3500)
      assert.are.equal('11:21', tostring(clock))
    end)
  end)

  describe('minus', function()
    it('should subtract minutes', function()
      local clock = clock.at(10, 3):minus(30)
      assert.are.equal('09:33', tostring(clock))
    end)

    it('should subtract to the previous hour', function()
      local clock = clock.at(10, 03):minus(70)
      assert.are.equal('08:53', tostring(clock))
    end)

    it('should subtract across midnight', function()
      local clock = clock.at(0, 3):minus(4)
      assert.are.equal('23:59', tostring(clock))
    end)

    it('should subtract more than two hours', function()
      local clock = clock.at(0, 0):minus(160)
      assert.are.equal('21:20', tostring(clock))
    end)

    it('should subtract more than two hours with borrow', function()
      local clock = clock.at(6, 15):minus(160)
      assert.are.equal('03:35', tostring(clock))
    end)

    it('should subtract more than one day', function()
      local clock = clock.at(5, 32):minus(1500)
      assert.are.equal('04:32', tostring(clock))
    end)

    it('should subtract more than two days', function()
      local clock = clock.at(2, 20):minus(3000)
      assert.are.equal('00:20', tostring(clock))
    end)
  end)

  describe('equal', function()
    it('should consider clocks with the same time to be equal', function()
      local clock1 = clock.at(15, 37)
      local clock2 = clock.at(15, 37)
      assert(clock1:equals(clock2))
    end)

    it('should consider clocks a minute apart to be different', function()
      local clock1 = clock.at(15, 36)
      local clock2 = clock.at(15, 37)
      assert.is_false(clock1:equals(clock2))
    end)

    it('should consider clocks an hour apart to be different', function()
      local clock1 = clock.at(14, 37)
      local clock2 = clock.at(15, 37)
      assert.is_false(clock1:equals(clock2))
    end)

    it('should identify equal clocks with hour overflow', function()
      local clock1 = clock.at(10, 37)
      local clock2 = clock.at(34, 37)
      assert(clock1:equals(clock2))
    end)

    it('should identify equal clocks with hour overflow by several days', function()
      local clock1 = clock.at(3, 11)
      local clock2 = clock.at(99, 11)
      assert(clock1:equals(clock2))
    end)

    it('should identify equal clocks with negative hours', function()
      local clock1 = clock.at(22, 40)
      local clock2 = clock.at(-2, 40)
      assert(clock1:equals(clock2))
    end)

    it('should identify equal clocks with negative hours that wrap', function()
      local clock1 = clock.at(17, 3)
      local clock2 = clock.at(-31, 3)
      assert(clock1:equals(clock2))
    end)

    it('should identify equal clocks with negative hours that wrap several times', function()
      local clock1 = clock.at(13, 49)
      local clock2 = clock.at(-83, 49)
      assert(clock1:equals(clock2))
    end)

    it('should identify equal clocks with minute overflow', function()
      local clock1 = clock.at(0, 1)
      local clock2 = clock.at(0, 1441)
      assert(clock1:equals(clock2))
    end)

    it('should identify equal clocks with minute overflow by several days', function()
      local clock1 = clock.at(2, 2)
      local clock2 = clock.at(2, 4322)
      assert(clock1:equals(clock2))
    end)

    it('should identify equal clocks with negative minutes', function()
      local clock1 = clock.at(2, 40)
      local clock2 = clock.at(3, -20)
      assert(clock1:equals(clock2))
    end)

    it('should identify equal clocks with negative minutes that wrap', function()
      local clock1 = clock.at(4, 10)
      local clock2 = clock.at(5, -1490)
      assert(clock1:equals(clock2))
    end)

    it('should identify equal clocks with negative minutes that wrap several times', function()
      local clock1 = clock.at(6, 15)
      local clock2 = clock.at(6, -4305)
      assert(clock1:equals(clock2))
    end)

    it('should identify equal clocks with negative hours and minutes', function()
      local clock1 = clock.at(7, 32)
      local clock2 = clock.at(-12, -268)
      assert(clock1:equals(clock2))
    end)

    it('should identify equal clocks with negative hours and minutes that wrap', function()
      local clock1 = clock.at(18, 7)
      local clock2 = clock.at(-54, -11513)
      assert(clock1:equals(clock2))
    end)
  end)
end)
