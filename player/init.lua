
--
-- Module dependencies.
--

local fsm = require('fsm')
local state = require('player/state')

--
-- Constants.
--

local spritewalk1 = 17
local spritewalk2 = 18
local spritewalk3 = 19

--
-- Player data type.
--

local function data()
  return {
    -- x-position in pixels
    x = 20,

    -- y-position in pixels
    y = 64,

    -- number of frames spent in current state
    at = 0,

    -- current sprite index
    sprite = 0,

    -- current direction
    dir = 0,
  }
end

--
-- Player draw function.
--

local function draw(data)
  -- TODO: flip sprite?
  spr(spritewalk1, data.x, data.y)
  yield()
  return draw(data)
end

--
-- Export constructor.
--

return {
  new = function()
    local u, d = fsm.new(state, draw, data())
    return { update = u, draw = d }
  end,
}
