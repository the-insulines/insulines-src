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
mainCharacter.animation:addConstantAnimation ( 'walk_right', 1, 8, MOVEMENT_SECONDS_PER_FRAME )
mainCharacter.animation:addConstantAnimation ( 'walk_left', 9, 8, MOVEMENT_SECONDS_PER_FRAME / 2 )

mainCharacter.prop = mainCharacter.animation.prop
mainCharacter.prop:setPiv ( 0, MAIN_CHARACTER_PIVOT )

mainCharacter.name = "main_character"

mainCharacter.render_at_start = true
mainCharacter.rendering = false

function mainCharacter:setLoc (x, y)
  self.prop:setLoc ( x, y )
end

function mainCharacter:xTextboxLocation ()
  return self.prop.getLoc.xLoc - 400
end

function mainCharacter:yTextboxLocation ()
  return self.prop.getLoc.yLoc + 300
end

function mainCharacter:stopCurrentAction ()
  if self.currentAction then
    self.currentAction:clear ()
    self.currentAction:stop ()
  end
end

function mainCharacter:moveThroughSteps ( steps, zoomFactor, callback )
  for k, step in pairs ( steps ) do

    MOAICoroutine.blockOnAction ( mainCharacter:moveTo ( step.position.x, step.position.y, zoomFactor ) )
    
    -- Adjust camera if required
    if game.autoFollow and step.offsets then
      -- Translate
      local camX, camY = game.camera:getLoc ()
      local camScl = game.camera:getScl ()
      local time = 1
      local sclTime = 1
      
      if step.offsets.x  then camX = step.offsets.x end
      if step.offsets.y  then camY = step.offsets.y end
      if step.offsets.scl  then camScl = step.offsets.scl end
      if step.offsets.time  then time = step.offsets.time end
      if step.offsets.sclTime  then time = step.offsets.sclTime end
      
      if self.currentCameraLocMovement then self.currentCameraLocMovement:stop () end
      if self.currentCameraSclMovement then self.currentCameraSclMovement:stop () end
      
      self.currentCameraLocMovement = game.camera:seekLoc (camX, camY, time, MOAIEaseType.LINEAR)
      self.currentCameraSclMovement = game.camera:seekScl (camScl, camScl, sclTime, MOAIEaseType.LINEAR)
    end
  end
  
  if callback then
    callback.method( callback.parent )
  end
end

function mainCharacter:moveTo ( x, y, zoomFactor, time )
  self:stopCurrentAction ()
  
  local curX, curY = self.prop:getLoc ()
  
  local delta_x = x - curX
  local delta_y = y - curY
  
  if not time then
    time = math.sqrt ( delta_x * delta_x + delta_y * delta_y) / MOVEMENT_PIXELS_PER_SECOND
  end
  -- If time == 0, moveLoc returns nil, which breaks the function
  if time == 0 then time = .001 end
  
  -- create the movement displacement action
  self.currentAction = self.prop:moveLoc ( delta_x, delta_y, time, MOAIEaseType.LINEAR )
  
  self.currentAction:setListener ( MOAIAction.EVENT_STOP, self.stopMove )
  
  if self.currentWalkAnimation then
    self.currentWalkAnimation:pause ()
  end
  
  if delta_x > 0 then
    self.currentWalkAnimation = mainCharacter.animation:startAnimation ( 'walk_right' )
  else
    self.currentWalkAnimation = mainCharacter.animation:startAnimation ( 'walk_left' )
  end
  
  -- add the walking animation action
  -- self.currentAction:addChild ( self:walkAnimation ( delta_x, time ) )
  
  -- shift the value zoomFactor units
  -- increase it if the character is heading down (delta_y negative) and decrease it if he is heading up
  local zoom = zoomFactor * - delta_y
  self.currentAction:addChild ( self.prop:moveScl ( zoom, zoom, time, MOAIEaseType.LINEAR ) )
  
  -- start
  self.currentAction:start ()
  return self.currentAction
end

function mainCharacter:stopMove ( char )
  mainCharacter.currentWalkAnimation:pause ()
end

-- function mainCharacter:walkAnimation ( delta_x, time )
--   if delta_x > 0 then
--     return self.animation:getAnimation ( 'walk_right' )
--   else
--     return self.animation:getAnimation ( 'walk_left' )
--   end
-- end

-- function mainCharacter:shutUp ()
--   self.dialogTextBox:setString ( "" )
-- end
-- 
-- function mainCharacter:say ( words )
--   self.dialogTextBox:setString ( words )
--   self.shadowTextBox:setString ( words )
-- end
