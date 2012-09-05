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
  
  -- initialize the character animations
  c.gfx = resource_cache.get ( name )
  c.animation:setDeck ( c.gfx )
  
  for animName, anim in pairs ( resource.animations ) do
    c.animation:addFramedAnimation ( animName, anim.frameTime, anim.mode )
  end
  
  -- initialize prop
  c.prop = c.animation.prop
  c.prop:setPiv ( resource.pivotX, resource.pivotY )
  
  -- default initialization values
  c.render_at_start = true
  c.rendering = false
  c.avoid_clicks = true
  
  
  -- methodsc
  
  function c:setLoc ( x, y )
    self.prop:setLoc ( x, y )
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
      callback.method ( callback.parent )
    end
  end
  
  
  function c:moveTo ( x, y, zoomFactor, time )
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
    self.currentAction.character = self
    
    self.currentAction:setListener ( MOAIAction.EVENT_STOP, self.stopMove )
    
    if self.currentWalkAnimation then
      self.currentWalkAnimation:pause ()
    end

    if math.abs ( delta_x ) > math.abs ( delta_y ) then
      if delta_x > 0 then
        self.currentWalkAnimation = self.animation:startAnimation ( 'walk_right' )
      else
        self.currentWalkAnimation = self.animation:startAnimation ( 'walk_left' )
      end
    elseif delta_y > 0 then
      self.currentWalkAnimation = self.animation:startAnimation ( 'walk_back' )
    else
      self.currentWalkAnimation = self.animation:startAnimation ( 'walk_front' )
    end
    
    -- shift the value zoomFactor units
    -- increase it if the character is heading down (delta_y negative) and decrease it if he is heading up
    local zoom = zoomFactor * - delta_y
    self.currentAction:addChild ( self.prop:moveScl ( zoom, zoom, time, MOAIEaseType.LINEAR ) )

    -- start
    self.currentAction:start ()
    return self.currentAction
  end
  

  function c.stopMove ( action )
    self = action.character
    self.currentWalkAnimation:pause ()
  end

  
  return c
end



