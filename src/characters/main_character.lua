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
mainCharacter.animation:addConstantAnimation ( 'walk_left', 9, 8, MOVEMENT_SECONDS_PER_FRAME )

mainCharacter.prop = mainCharacter.animation.prop
mainCharacter.prop:setPiv ( 0, MAIN_CHARACTER_PIVOT )

mainCharacter.name = "main_character"

mainCharacter.render_at_start = false
mainCharacter.rendering = false


-- mainCharacter.dialogTextBox = MOAITextBox.new ()
-- mainCharacter.dialogTextBox:setFont ( game.defaultFont )
-- mainCharacter.dialogTextBox:setTextSize ( 40 )
-- mainCharacter.dialogTextBox:setYFlip( true )
-- mainCharacter.dialogTextBox:setAlignment( MOAITextBox.CENTER_JUSTIFY, MOAITextBox.CENTER_JUSTIFY)
-- mainCharacter.dialogTextBox:setColor ( unpack ( MAIN_CHARACTER_DIALOG_COLOR ))
-- 
-- mainCharacter.shadowTextBox = MOAITextBox.new ()
-- mainCharacter.shadowTextBox:setFont ( game.defaultFont )
-- mainCharacter.shadowTextBox:setTextSize ( 40 )
-- mainCharacter.shadowTextBox:setYFlip( true )
-- mainCharacter.shadowTextBox:setAlignment( MOAITextBox.CENTER_JUSTIFY, MOAITextBox.CENTER_JUSTIFY)
-- mainCharacter.shadowTextBox:setColor ( 0, 0, 0, 1)

function mainCharacter:setLoc (x, y)
  self.prop:setLoc ( x, y )
  -- self.dialogTextBox:setRect ( 0, 0, 1000, 45)
  -- self.shadowTextBox:setRect ( 0, 0, 1000, 45)
  -- self.dialogTextBox:setLoc(x - 500 - MAIN_CHARACTER_TEXT_LOCATION_OFFSET.x, y + 45 - MAIN_CHARACTER_TEXT_LOCATION_OFFSET.y)
  -- self.shadowTextBox:setLoc(x - 500 - MAIN_CHARACTER_TEXT_LOCATION_OFFSET.x + MAIN_CHARACTER_DIALOG_SHADOW_OFFSET.x, y + 45 - MAIN_CHARACTER_TEXT_LOCATION_OFFSET.y + MAIN_CHARACTER_DIALOG_SHADOW_OFFSET.y)
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
  
  -- If time == 0, moveLoc returns nil, which breaks the function
  if time == 0 then time = .001 end
  
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

function mainCharacter:shutUp ()
  self.dialogTextBox:setString ( "" )
end

function mainCharacter:say ( words )
  self.dialogTextBox:setString ( words )
  self.shadowTextBox:setString ( words )
  print ( self.dialogTextBox:revealAll ())
end
