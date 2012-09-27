-- point2d.lua
-- A class representing vectors in 2D

function point ( x, y )
  return Point2d.new ( x, y )
end


Point2d = {}
Point2d.__index = Point2d


function Point2d.new ( x, y )
  local newObj = {}
    newObj.x = x
    newObj.y = y
  
  setmetatable ( newObj, Point2d )
  return newObj
end


function Point2d:__eq ( p )
  return (self.x == p.x) and (self.y == p.y)
end


-- vector addition is '+','-'
function Point2d:__add ( p )
  return Point2d.new ( self.x + p.x, self.y + p.y )
end


function Point2d:__sub ( p )
  return Point2d.new ( self.x - p.x, self.y - p.y )
end


-- unitary minus  (e.g in the expression f(-p))
function Point2d:__unm ()
  return Point2d.new ( -self.x, -self.y )
end


-- scalar multiplication and division is '*' and '/' respectively
function Point2d:__mul ( s )
  return Point2d.new ( s * self.x, s * self.y )
end


function Point2d:__div ( s )
  return Point2d.new ( self.x / s, self.y / s )
end


function Point2d:__concat ( p )
  if self.x or self.y then
    return p .. '(' .. self.x .. ',' .. self.y .. ')'
  else
    return p
  end
end


function Point2d:dotProduct ( p )
  return self.x * p.x + self.y * p.y
end


function Point2d:normalize ()
  local l = self:len ()
  self.x = self.x / l
  self.y = self.y / l
end


function Point2d:set ( x, y, z )
  self.x = x
  self.y = y
end


function Point2d:translate ( x, y, z )
  self.x = self.x + x
  self.y = self.y + y
end


function Point2d:__tostring ()
  return string.format ( '(%f , %f)', self.x, self.y )
end


function Point2d:len ()
  return math.sqrt ( self.x * self.x + self.y * self.y )
end


function Point2d:squaredLen ()
  return self.x * self.x + self.y * self.y
end
