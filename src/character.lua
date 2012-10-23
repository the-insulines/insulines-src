--==============================================================
-- The Insulines
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================

module ( "character", package.seeall )


function new ( name )
  local resource = resources[name]
  
  local c = {}
  c.name = name
  c.animation = AnimatedProp.new ( resource.type )
  c.animation.currentAction = nil
  c.direction = DIRECTION_FRONT
  
  -- initialize the character animations
  c.gfx = resource_cache.get ( name )
  c.animation:setDeck ( c.gfx )
  
  for animName, anim in pairs ( resource.animations ) do
    c.animation:addAnimation ( animName, anim.startFrame, anim.frameCount, anim.frameTime, anim.mode )
  end
  
  -- initialize prop
  c.prop = c.animation.prop
  c.prop:setPiv ( resource.pivotX, resource.pivotY )
  
  -- default initialization values
  c.render_at_start = true
  c.rendering = false
  c.avoid_clicks = true
  
  
  -- methods
  
  function c:setLoc ( x, y )
    self.prop:setLoc ( x, y )
  end

  function c:setScl ( scaleX, scaleY )
    self.prop:setScl ( scaleX, scaleY )
  end
  
  function c:getPosition ()
    return point ( self.prop:getLoc () )
  end
  
  
  function c:startAnimation ( animationName )
    self.currentAction = self.animation:startAnimation( animationName )
  end
  
  
  function c:stopCurrentAction ()
    if self.currentAction then
      self.currentAction:clear ()
      self.currentAction:stop ()
    end
  end
  
  
  function c:moveThroughSteps ( steps, zoomFactor, callback )
    for k, step in pairs ( steps ) do
      
      MOAICoroutine.blockOnAction ( self:moveTo ( step.position.x, step.position.y, zoomFactor ) )
      
      -- TODO: refactor this
      -- Adjust camera if required
      if game.autoFollow and step.offsets then
        -- Run step action if set
        if step.action then
          step.action ()
        end
        
        -- Translate
        local camX, camY = game.camera:getLoc ()
        local camScl = game.camera:getScl ()
        local time = 1
        local sclTime = 1
        
        if step.offsets.x  then camX = step.offsets.x / SCREEN_TO_WORLD_RATIO end
        if step.offsets.y  then camY = step.offsets.y / SCREEN_TO_WORLD_RATIO end
        if step.offsets.scl  then camScl = step.offsets.scl end
        if step.offsets.time  then time = step.offsets.time end
        if step.offsets.sclTime  then time = step.offsets.sclTime end
        
        if self.currentCameraLocMovement then self.currentCameraLocMovement:stop () end
        if self.currentCameraSclMovement then self.currentCameraSclMovement:stop () end
        
        self.currentCameraLocMovement = game.camera:seekLoc (camX, camY, time, MOAIEaseType.LINEAR)
        self.currentCameraSclMovement = game.camera:seekScl (camScl, camScl, sclTime, MOAIEaseType.LINEAR)
      end
    end
    
    -- play the idle animation corresponding to the current character orientation (if it exists)
    self:standLookingInDirection (self.direction)
    
    -- movement callback
    if callback then
      callback.method ( callback.parent )
    end
  end
  
  
  function c:moveTo ( x, y, zoomFactor, time )
    self:stopCurrentAction ()

    local direction, delta = self:directionTo ( point ( x, y ) )
    self.direction = direction
    
    if not time then
      time = math.sqrt ( delta.x * delta.x + delta.y * delta.y ) / MOVEMENT_PIXELS_PER_SECOND
    end
    -- If time == 0, moveLoc returns nil, which breaks the function
    if time == 0 then time = .001 end
    
    -- create the movement displacement action
    self.currentAction = self.prop:moveLoc ( delta.x, delta.y, time, MOAIEaseType.LINEAR )
    self.currentAction.character = self
    
    self.currentAction:setListener ( MOAIAction.EVENT_STOP, self.stopMove )
    
    if self.currentWalkAnimation then
      self.currentWalkAnimation:pause ()
    end
    
    -- start the animation depending on the character movement orientation
    self.currentWalkAnimation = self.animation:getAnimation ( 'walk_' .. self.direction )
    if self.currentWalkAnimation then
      self.currentWalkAnimation:start ()
    end
    
    -- shift the value zoomFactor units
    -- increase it if the character is heading down (delta_y negative) and decrease it if he is heading up
    local zoom = zoomFactor * - delta.y
    self.currentAction:addChild ( self.prop:moveScl ( zoom, zoom, time, MOAIEaseType.LINEAR ) )

    -- start
    self.currentAction:start ()
    return self.currentAction
  end
  
  
  function c:lookAt ( targetPoint )
    local direction = self:directionTo ( targetPoint )
    self:standLookingInDirection ( direction )
  end
  
  
  function c:directionTo ( targetPoint )
    local currentPos = point ( self.prop:getLoc () )

    local delta = targetPoint - currentPos
    local direction = nil
    
    if math.abs ( delta.x ) > math.abs ( delta.y ) then
      if delta.x > 0 then
        direction = DIRECTION_RIGHT
      else
        direction = DIRECTION_LEFT
      end
    elseif delta.y > 0 then
      direction = DIRECTION_BACK
    else
      direction = DIRECTION_FRONT
    end
    
    return direction, delta
  end
  

  function c.stopMove ( action )
    self = action.character
    if self.currentWalkAnimation then
      self.currentWalkAnimation:pause ()
    end
  end


  function c:standLookingInDirection ( direction )
    self.direction = direction
    
    -- play the idle animation corresponding to the current character orientation (if it exists)
    self:stopCurrentAction ()
    self.currentAction = self.animation:getAnimation ( 'stand_' .. self.direction )
    if self.currentAction then
      self.currentAction:start ()
    end
  end
  
  return c
end



