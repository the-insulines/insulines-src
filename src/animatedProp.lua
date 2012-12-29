--==============================================================
-- The Insulines
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================

--module ( "animatedProp", package.seeall )

AnimatedProp = {}
AnimatedProp.__index = AnimatedProp

---------------
-- constants --
---------------

AnimatedProp.ANIMATION_TYPE_SPRITESHEET = RESOURCE_TYPE_TILED_IMAGE
AnimatedProp.ANIMATION_TYPE_MULTITEXTURE = RESOURCE_TYPE_ANIMATION_FRAMES


-------------
-- methods --
-------------

function AnimatedProp.new ( animationType )
  local newObj = {}
    newObj.animationType = animationType
    newObj.animationFrames = {}
    newObj.sounds = {}
    newObj.animations = {}
    newObj.currentAnimation = nil
    newObj.prop = MOAIProp2D.new ()
    -- newObj.remapper = nil
  
  setmetatable ( newObj, AnimatedProp )
  
  return newObj
end


function AnimatedProp:addFrames ( name, animationFrames )
  if self.animationFrames == nil then self.animationFrames = {} end
  self.animationFrames[name] = animationFrames
end


function AnimatedProp:setDeck ( animationFrames )
  self.animationFrames = animationFrames
  
  -- if the frames are in form of a spritesheet, link the whole spritesheet to the underlying prop
  if self.animationType == AnimatedProp.ANIMATION_TYPE_SPRITESHEET then
    self.prop:setDeck ( animationFrames )
    
    -- create the remapper
    self.remapper = MOAIDeckRemapper.new ()
    self.remapper:reserve ( 1 )
    self.prop:setRemapper ( self.remapper )
  else
    for k, v in pairs( self.animationFrames ) do
      self.prop:setDeck ( v[1] )
    end
  end
end


function AnimatedProp:addAnimation ( name, startFrame, frameCount, frameTime, animationMode, parentAnimationName )
  
  -- load the animation time
  local baseTime = 0
  local frameTimeMultiplier = {}
  
  if type ( frameTime ) == 'number' then
    -- if all frames should last the same time
    baseTime = frameTime
    frameTimeMultiplier = {}
    
  elseif type ( frameTime ) == 'table' then
    -- if the times of the animation shouldn't be all equal
    -- set the base time
    baseTime = frameTime.baseTime
    
    -- collect the multiplier of each frame on a table
    for k, frameMultiplier in pairs ( frameTime.multipliers ) do
      frameTimeMultiplier[frameMultiplier.frame] = frameMultiplier.times
    end
  end
  
  -- create the driving curve
  local curve, animationTotalTime = AnimatedProp.createCurve ( startFrame, frameCount, baseTime, frameTimeMultiplier )
  
  -- set the default animationMode to LOOP
  if not animationMode then animationMode = MOAITimer.LOOP end
  
  local animation
  
  if self.animationType == AnimatedProp.ANIMATION_TYPE_SPRITESHEET then
    -- spritesheet animation
    animation = AnimatedProp.createSpritesheetAnimation ( name, startFrame, frameCount, frameTime, animationMode, curve, self.remapper )
    
  elseif self.animationType == AnimatedProp.ANIMATION_TYPE_MULTITEXTURE then
    -- multitexture animation
    -- load the corresponding frames
    local frames = self.animationFrames[name]
    if parentAnimationName then
      frames = self.animationFrames[parentAnimationName]
    end
    
    animation = AnimatedProp.createMultitextureAnimation ( name, frames, startFrame, frameCount, frameTime, animationMode, curve, animationTotalTime )
    animation.animatedProp = self
  end
  
  -- store it under the name of the animation
  self.animations[name] = animation
end


-- create an animation curve. For equally timed frames, frameTime should be a number, otherwise if it is a table it should contain the timing for each frame
function AnimatedProp.createCurve ( startFrame, frameCount, baseTime, frameTimeMultiplier )
  local curve = MOAIAnimCurve.new ()
  curve:reserveKeys ( frameCount )
  
  local currentTime = 0
  
  for frame = 1, frameCount do
    -- set the key linked to this frame on the curve
    curve:setKey ( frame, currentTime, startFrame + (frame - 1), MOAIEaseType.LINEAR )
    
    -- update the accumulated time to be used as the beginning of the next frame
    if frameTimeMultiplier[frame] then
      currentTime = currentTime + baseTime * frameTimeMultiplier[frame]
    else
      currentTime = currentTime + baseTime
    end
  end
  
  return curve, currentTime
end


function AnimatedProp.createSpritesheetAnimation ( name, startFrame, frameCount, frameTime, animationMode, curve, remapper )
  -- create the animation that links the animation curve with the remapper
  local anim = MOAIAnim:new ()
  anim:reserveLinks ( 1 )
  
  anim:setLink ( 1, curve, remapper, 1 )
  anim:setMode ( animationMode )
  
  return anim
end


function AnimatedProp.createMultitextureAnimation ( name, frames, startFrame, frameCount, frameTime, animationMode, curve, animationTotalTime )
  -- create the timer that triggers the events in the times set by the curve
  local anim = MOAITimer.new ()
  anim:setMode ( animationMode )
  anim:setSpan ( animationTotalTime )
  anim:setCurve ( curve )
  anim:setListener ( MOAITimer.EVENT_TIMER_KEYFRAME, AnimatedProp.updateFrame )
  
  -- add some aditional information necessary for the animation to the timer object
  anim.frames = frames
  anim.name = name
  
  return anim
end


function AnimatedProp.updateFrame ( anim, keyframe, timesExecuted, time, value )
  local self = anim.animatedProp
  self.prop:setDeck ( anim.frames[value] )
  
  if anim.frames.sounds and anim.frames.sounds[value] then
    anim.frames.sounds[value]:play ()
  end
  
  if anim.listener then
    anim.listener ( anim.name, value )
  end
end


---------------------------------
-- configuration of animations --
---------------------------------

function AnimatedProp:setAnimationListener ( animationName, listener )
  anim = self.animations[animationName]
  if anim then
    anim.listener = listener
  end
end


function AnimatedProp:clearAnimationListener ( animationName )
  self.animations[animationName].listener = nil
end


------------------------------------------
-- retrieval and playback of animations --
------------------------------------------

function AnimatedProp:getAnimation ( name )
  return self.animations[name]
end


function AnimatedProp:startAnimation ( name )
  if self.currentAnimation then self.currentAnimation:stop () end
  self.currentAnimation = self:getAnimation ( name )
  self.currentAnimation:start ()
  return self.currentAnimation
end


function AnimatedProp:stopCurrentAnimation ()
  if self.currentAnimation then
    self.currentAnimation:stop ()
  end
end


function AnimatedProp:stopAnimation ( name )
  MOAICoroutine.blockOnAction ( self.animations[name]:stop () )
  self.currentAnimation = nil
end


function AnimatedProp:pauseAnimation ( name )
  MOAICoroutine.blockOnAction ( self.animations[name]:pause () )
  self.currentAnimation = nil
end


-------------------------------------
-- methods forwarded to MOAIProp2D --
-------------------------------------

function AnimatedProp:setLoc ( ... )
  self.prop:setLoc ( unpack (arg) )
end
