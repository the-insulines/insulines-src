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
mainCharacter.avoid_clicks = true

-- initialize the character animations
mainCharacter.animation:setDeck (  mainCharacter.gfx )
mainCharacter.animation:addConstantAnimation ( 'walk_down', 10, 9, MOVEMENT_SECONDS_PER_FRAME )
mainCharacter.animation:addConstantAnimation ( 'walk_left', 9*3 + 2, 8, MOVEMENT_SECONDS_PER_FRAME )
mainCharacter.animation:addConstantAnimation ( 'stop_left', 9*3 + 1, 0, MOVEMENT_SECONDS_PER_FRAME )
mainCharacter.animation:addConstantAnimation ( 'walk_right', 9*5 + 2, 8, MOVEMENT_SECONDS_PER_FRAME )
mainCharacter.animation:addConstantAnimation ( 'stop_right', 9*5 + 1, 0, MOVEMENT_SECONDS_PER_FRAME )
mainCharacter.animation:addConstantAnimation ( 'walk_top', 9*7 + 1, 9, MOVEMENT_SECONDS_PER_FRAME )

mainCharacter.prop = mainCharacter.animation.prop
mainCharacter.prop:setPiv ( 0, MAIN_CHARACTER_PIVOT )

mainCharacter.name = "main_character"

mainCharacter.render_at_start = true

function mainCharacter:stopCurrentAction ()
  if self.currentAction then
    self.currentAction:clear ()
    self.currentAction:stop ()
  end
end

function mainCharacter:moveThroughSteps ( steps, zoomFactor )

  for k, step in pairs ( steps ) do
    MOAICoroutine.blockOnAction ( mainCharacter:moveTo ( step.x, step.y, zoomFactor ) )
  end
  
end

function mainCharacter:moveTo ( x, y, zoomFactor )

  self:stopCurrentAction ()
  
  local curX, curY = self.prop:getLoc ()
  
  local delta_x = x - curX
  local delta_y = y - curY
  
  local time = math.sqrt ( delta_x * delta_x + delta_y * delta_y) / MOVEMENT_PIXELS_PER_SECOND
  
  -- create the movement displacement action
  self.currentAction = self.prop:moveLoc ( delta_x, delta_y, time, MOAIEaseType.LINEAR )
  
  -- add the walking animation action
  self.currentAction:addChild ( self:walkAnimation ( delta_x, time ) )
  
  -- add the zoom action
  local zoom = zoomFactor * delta_y
  self.currentAction:addChild ( self.prop:moveScl ( zoom, zoom, time, MOAIEaseType.LINEAR ) )
  
  -- start
  self.currentAction:start ()
  return self.currentAction
end

function mainCharacter:walkAnimation ( delta_x, time )
  if delta_x > 0 then
    return self.animation:getAnimation ( 'walk_right' )
  else
    return self.animation:getAnimation ( 'walk_left' )
  end
end
