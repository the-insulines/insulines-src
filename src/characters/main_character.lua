--==============================================================
-- The Insulines
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================


mainCharacter = {}
mainCharacter.gfx = resource_cache.get ( 'main_character' )

mainCharacter.animation = AnimatedProp.new ()
mainCharacter.animation.currentAction = nil

-- initialize the character animations
mainCharacter.animation:setDeck (  mainCharacter.gfx )
mainCharacter.animation:addConstantAnimation ( 'walk_down', 10, 9, MOVEMENT_SECONDS_PER_FRAME )
mainCharacter.animation:addConstantAnimation ( 'walk_left', 9*3 + 2, 8, MOVEMENT_SECONDS_PER_FRAME )
mainCharacter.animation:addConstantAnimation ( 'stop_left', 9*3 + 1, 0, MOVEMENT_SECONDS_PER_FRAME )
mainCharacter.animation:addConstantAnimation ( 'walk_right', 9*5 + 2, 8, MOVEMENT_SECONDS_PER_FRAME )
mainCharacter.animation:addConstantAnimation ( 'stop_right', 9*5 + 1, 0, MOVEMENT_SECONDS_PER_FRAME )
mainCharacter.animation:addConstantAnimation ( 'walk_top', 9*7 + 1, 9, MOVEMENT_SECONDS_PER_FRAME )

mainCharacter.prop = mainCharacter.animation.prop

mainCharacter.name = "main_character"

mainCharacter.render_at_start = true

function mainCharacter:stopCurrentAction ()
  if self.currentAction then
    self.currentAction:clear ()
    self.currentAction:stop ()
  end
end


function mainCharacter:moveTo ( x, y )
  self:stopCurrentAction ()
  ------------------ DEBUG
  checkMem( false )
  ------------------ DEBUG
  
  local curX, curY = self.prop:getLoc ()
  
  local delta_x = x - curX
  local delta_y = y - curY
  
  local time = math.sqrt ( delta_x * delta_x + delta_y * delta_y) / MOVEMENT_PIXELS_PER_SECOND
  
  self.currentAction = self.prop:moveLoc ( delta_x, delta_y, time, MOAIEaseType.LINEAR )  
  
  for i = 1, 10 do
    self.currentAction:addChild ( self:walkAnimation ( delta_x, time ) )
  end
  
  self.currentAction:start ()
end

function mainCharacter:walkAnimation ( delta_x, time )
  if delta_x > 0 then
    return self.animation:getAnimation ( 'walk_right' )
  else
    return self.animation:getAnimation ( 'walk_left' )
  end
end


--[[
function main_character ()
  local main_character = {}

  -- Load character images
  main_character.gfx = resource_cache.loadImage("Main Character", "../insulines-gfx/dummy_character.png", -109, -314, 109, 314)

  -- Create prop
  prop = MOAIProp2D.new ()
  prop:setDeck ( main_character.gfx )
  main_character.prop = prop

  -- Movement function
  main_character.moveTo = function(self, x, y)

    -- Stop current movement
    if self.currentAction then
      self.currentAction:stop()
    end
  
    local curX, curY = self.prop:getLoc ()
    local delta_x = x - curX
    local delta_y = y - curY
  
    self.currentAction = self.prop:moveLoc(delta_x, delta_y, 2, MOAIEaseType.LINEAR)
    return self.currentAction
  end
  return main_character
end
--]]
